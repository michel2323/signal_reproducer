using AMDGPU
using Profile
using BenchmarkTools

function signals_ipc(N, ipc=true)
  for i in 1:N
    ROCSignal(;pooled=false, ipc)
  end
end

# Using IPC is slow
@btime signals_ipc(50, true)
# Not using IPC is fast
@btime signals_ipc(50, false)



