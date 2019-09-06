function result = read_citcoms_time(filename,kappa,L)
fh = fopen(filename,'r');
%step total_t delta_t total_cpu_time step_cpu_time
data = textscan(fh,'%d %f %f %f %f');
timesteps = data{1};

result.timestep = timesteps;
result.time_nd = data{2};
%convert nondimensional time to dimensional time
ts = L^2/kappa;%has units of time
result.time_s = data{2} * ts;
seconds_in_year = 365.25*24*3600;
result.time_yr = result.time_s/seconds_in_year;
time_ma = result.time_yr/1e6;
time_ma = time_ma(end)-time_ma;
result.time_ma = time_ma;

end