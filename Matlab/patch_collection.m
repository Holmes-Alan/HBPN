%% image data
folder1 = 'NTIRE2019\TrainGT';
folder2 = 'NTIRE2019\TrainLR';
size_input = 256;
size_label = 256;
stride = 128;
%% generate data
filepaths1 = dir(fullfile(folder1,'*.png'));
filepaths2 = dir(fullfile(folder2,'*.png'));
for d = 0:3
    index = randperm(60);
    for k = 1 : 6
        fprintf('iteration: %d \n', k);
        savepath = fullfile('G:\Data\ImgSR',sprintf('train_%d.h5',k+6*d));
        count = 0;
        for i = 1 : 10
            HR = imread(fullfile(folder1,filepaths1(index(i+10*(k-1))).name));
            LR = imread(fullfile(folder2,filepaths2(index(i+10*(k-1))).name));
            HR = im2double(HR);
            LR = im2double(LR);
            HR = modcrop(HR, 2);
            LR = modcrop(LR, 2);
            HR = imrotate(HR,90*d);  %HR = fliplr(imrotate(HR,90*d)) function for another augmentation
            LR = imrotate(LR,90*d);  %LR = fliplr(imrotate(LR,90*d)) function for another augmentation
            [hei,wid,chan] = size(HR);
            for x = 1 : stride : hei-size_label+1
                for y = 1 :stride : wid-size_label+1
                    subim_HR = HR(x : x+size_label-1, y : y+size_label-1, :);
                    subim_LR = LR(x : x+size_label-1, y : y+size_label-1, :);
                    count=count+1;
                    data(:, :, :, count) = subim_LR;
                    label(:, :, :, count) = subim_HR;
                end
            end
        end
        order = randperm(count);
        data = data(:, :, :, order);
        label = label(:, :, :, order);
        %% writing to HDF5
        chunksz = 20;
        created_flag = false;
        totalct = 0;
        for batchno = 1:floor(count/chunksz)
            last_read=(batchno-1)*chunksz;
            batchdata = data(:,:,:,last_read+1:last_read+chunksz);
            batchlabs = label(:,:,:,last_read+1:last_read+chunksz);
            startloc = struct('dat',[1,1,1,totalct+1], 'lab', [1,1,1,totalct+1]);
            curr_dat_sz = store2hdf5(savepath, batchdata, batchlabs, ~created_flag, startloc, chunksz);
            created_flag = true;
            totalct = curr_dat_sz(end);
        end
        h5disp(savepath);
    end
end