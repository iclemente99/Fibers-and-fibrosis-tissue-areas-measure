
imagesfiles = dir('*.tif');
nfiles = length(imagesfiles);

Areas_tissue = zeros(1,nfiles);
Areas_fibrosis = zeros(1,nfiles);
Areas_total = zeros(1,nfiles);
Nimagenes = {};

for ii=1:nfiles
   currentfilename = imagesfiles(ii).name;
   currentimage = imread(currentfilename);
   Areas_tissue(ii) = Area_tissue(currentimage);
   Areas_fibrosis(ii) = Area_fibrosis(currentimage);
   [row column] = size(currentimage);
   Area_total = row*column;
   Areas_total(ii) = Area_total;
   Nimagenes(ii) = {currentfilename};
end

Areas = vertcat(Areas_fibrosis, Areas_tissue, Areas_totales);
rowNames = {'Area_fibrosis', 'Area_tissue', 'Areas_totales'};
colNames = Nimagenes;
Results = array2table(Areas,'RowNames',rowNames,'VariableNames',colNames);

writetable(Results,'Area_measure_normal_light.csv')