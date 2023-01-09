scheme = "Fuzzy cruise controller\Fuzzy_cruise_controller.zcos";

// Simulate first
importXcosDiagram(scheme);
typeof(scs_m); //The diagram data structure
ctx = ["m = 1000; b = 1; T = 0.1; stp = 30; stp1 = 40; std_noise = 1;"];

scs_m.props.context = ctx;
xcos_simulate(scs_m, 4);

// Draw
subplot(212);
h = plot(u_out.time, u_out.values, 'b-', 'LineWidth',3);
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 0;600 100];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Throttle [%]', 'font_style', 'times bold', 'font_size', 3);

subplot(211);
h = plot(y_out.time, y_out.values, 'b-', stp_out.time, stp_out.values, 'r-', 'LineWidth',3);
l = legend("Response", "Setpoint");
l.font_size = 3;
ax=gca(),// get the handle on the current axes
ax.data_bounds=[0 0;600 50];
set(gca(),"grid",[1 1]);
xlabel('t[s]', 'font_style', 'times bold', 'font_size', 3);
ylabel('Speed [m/s]', 'font_style', 'times bold', 'font_size', 3);
