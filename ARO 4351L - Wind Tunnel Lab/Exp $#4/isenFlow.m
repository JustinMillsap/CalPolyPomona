function M = isenFlow(pOverPt)
    gamma = 1.4;
    M = sqrt((2 / (gamma-1)) * ((pOverPt)^(-(gamma - 1)/gamma) - 1));
end