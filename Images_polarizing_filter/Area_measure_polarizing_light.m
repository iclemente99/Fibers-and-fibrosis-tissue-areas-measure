
imagesfiles = dir('*.tif');
nfiles = length(imagesfiles);

Areas_thin_fibers = zeros(1,nfiles);
Areas_thick_fibers = zeros(1,nfiles);
Nimagenes = {};

for ii=1:nfiles
   currentfilename = imagesfiles(ii).name;
   currentimage = imread(currentfilename);
   Areas_thin_fibers(ii) = Area_thin_fibers(currentimage);
   Areas_thick_fibers(ii) = Area_thick_fibers(currentimage);
   Nimagenes(ii) = {currentfilename};
end

Areas = vertcat(Areas_thin_fibers, Areas_thick_fibers);
rowNames = {'Areas_thin_fibers','Area_thick_fibers'};
colNames = Nimagenes;
Results = array2table(Areas,'RowNames',rowNames,'VariableNames',colNames);

writetable(Results,'Area_measure_polirizing_light.csv')