defmodule EX6 do
  #import :erlang, only: [binary_to_term: 1, term_to_binary: 1]

  #@ip {127, 0, 0, 1}

  # Initialize communication
  def init(port \\ 8080) do
    #{:ok, socket} = :gen_udp.open(port, [:binary, active: false])

    {:ok, pid_p} = Task.start(fn -> counter(:inactive, :NO_PID, :NO_NUMBER) end)
    {:ok, pid_b} = Task.start(fn -> counter(:inactive, :NO_PID, :NO_NUMBER) end)

    send(pid_p, {:pid, pid_b})
    send(pid_b, {:pid, pid_p})

    {pid_p, pid_b}
  end

  # Start counting
  def start(pid, port \\ 8080) do
    send(pid, {:primary, 0})
    #:gen_udp.send(socket, @ip, port, term_to_binary({:primary, 0}))
  end

  # Kill process with given Process ID
  def kill(pid) do
    Process.exit(pid, :kill)
  end

  def counter(state, backup, number) do
    receive do
      :alive ->
        # Alive message from primary
        counter(state, backup, number)

      {:primary, new_number} ->
        # Print new number
        IO.puts(new_number)

        # Send alive message and new number to backup
        send(backup, :alive)
        send(backup, {:backup, new_number})

        # Send new number + 1 to myself
        send(self(), {:primary, new_number + 1})
        :timer.sleep(200)
        counter(:active, backup, number)

      {:backup, new_number} ->
        counter(:active, backup, new_number)

      {:pid, new_pid} ->
        # Process ID to the backup
        counter(state, new_pid, number)
    after
      1_000 ->
        case state do
          :inactive ->
            # Continue as nothing happened
            counter(state, backup, number)

          :active ->
            # Become primary
            IO.puts("Primary is dead...")
            IO.puts("Process #{inspect(self())} taking over...")
            send(self(), {:primary, number + 1})
            counter(state, backup, number + 1)
        end
    end
  end

  #def ip() do @ip end

end