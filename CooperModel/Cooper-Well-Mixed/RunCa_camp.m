a=[0.1 0.4 0.45 2 4.5 5]; %chosen a values
for i=1:length(a)
[t,C]=ca_camp(a(i));
CaLCFig(t, C)
end