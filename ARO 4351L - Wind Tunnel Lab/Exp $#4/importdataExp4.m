function ARO4351LExp4Datareva = importdataExp4(workbookFile, sheetName, dataLines)
%IMPORTFILE Import data from a spreadsheet
%  ARO4351LEXP4DATAREVA = IMPORTFILE(FILE) reads data from the first
%  worksheet in the Microsoft Excel spreadsheet file named FILE.
%  Returns the data as a table.
%
%  ARO4351LEXP4DATAREVA = IMPORTFILE(FILE, SHEET) reads from the
%  specified worksheet.
%
%  ARO4351LEXP4DATAREVA = IMPORTFILE(FILE, SHEET, DATALINES) reads from
%  the specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  ARO4351LExp4Datareva = importfile("C:\Users\jtmil\OneDrive\Desktop\Cal Poly Pomona\CPP GIT\ARO 4351L - Wind Tunnel Lab\Exp $#4\ARO4351L_Exp 4 Data rev a .xlsx", "M3.6", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 14-Mar-2024 16:18:18

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 53);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = dataLines(1, :);

% Specify column names and types
opts.VariableNames = ["Time", "P_tank", "dx", "P_P0", "M", "T0", "x8101", "x8102", "P0", "Model1", "Model2", "Model3", "Model4", "Model5", "TS1", "TS2", "TS3", "TS4", "TS5", "TS6", "TS7", "TS8", "Nozz1", "Nozz2", "Nozz3", "Nozz4", "Nozz5", "Nozz6", "Nozz7", "Nozz8", "Nozz9", "Nozz10", "Nozz11", "Nozz12", "Nozz13", "Nozz14", "Nozz15", "Nozz16", "Nozz17", "Nozz18", "Nozz19", "Nozz20", "Nozz21", "Nozz22", "Nozz23", "Nozz24", "Nozz25", "Nozz26", "Nozz27", "Nozz28", "Nozz29", "Nozz30", "Nozz31"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "categorical", "categorical", "categorical", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, ["Model2", "Model3", "Model4", "Model5"], "EmptyFieldRule", "auto");

% Import the data
ARO4351LExp4Datareva = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = dataLines(idx, :);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    ARO4351LExp4Datareva = [ARO4351LExp4Datareva; tb]; %#ok<AGROW>
end

end