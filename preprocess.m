clear;
close all;
clc;
current_fol = 'D:/COVID_Paper/train_image_folder'; %Select the folder where you have the training images
dest_fol='D:/COVID_Paper/train_image_folder'; %Select the folder where you want to save the preprocessed images
if ~isfolder(current_fol)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', current_fol);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(current_fol, '*.jpeg');
pngFiles = dir(filePattern);
for k = 1:length(pngFiles) %This loop runs across the files and converts all the files in the folder
  baseFileName = pngFiles(k).name;
  fprintf(baseFileName)
  fullFileName = fullfile(current_fol, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);    
  img=imread(fullFileName);
  info=imfinfo(fullFileName);
  if(info.BitDepth>8)
    img=rgb2gray(img);
  end
  bw = (img > 0.65*165); % PLEASE ADJUST 0.82 OR 165 TO GET BETTER RESULT 
  lbl = bwlabel(bw);     
  props = regionprops(lbl, 'Solidity', 'Area');
  solidity = [props.Solidity];
  area = [ props.Area];  
  hiSolid= solidity > 0.3; 
  maxArea = max( area(hiSolid));  
  tumorLabel = find( area==maxArea);  
  tumor = ismember(lbl, tumorLabel);  
  sk=uint8(tumor);
  sk1=sk.*img;
  skull=sk1;
  I=imbinarize(skull);
  I=imcomplement(I);
  %PLEASE CHANGE THE IMAGE NAME TO BE SAVED;
  J=immultiply(img,I);
  [sourceFolder, baseFileNameNoExtenstion, ext] = fileparts(fullFileName);
  outputBaseName = [baseFileNameNoExtenstion, '.png'];
  fullDestinationFileName = fullfile(dest_fol, outputBaseName);
  imwrite(J,fullDestinationFileName);
end
fprintf('Done!');