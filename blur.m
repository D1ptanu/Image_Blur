function blurX( img, w)           
[a,b]= size(img);
out= zeros( a, b,'uint8');          % preallocation for faster matrix operation
for aa= 1:a
    for bb= 1:b
        i= subarray(aa,bb,w,a,b);
        sa = img(i(1):i(2),i(3):i(4));
        [m,n]= size(sa);
        t= sum(sum(sa));
        avg= uint8(t/(m*n));
        out(aa,bb)= avg; 
    end
end
imshow(out)                          % Displays the output in a MATLAB window 
imwrite(out,'blur.png');             % Exports the new image in the pwd as a .png file
        
function indices= subarray(x,y,w,a,b)  %returns the indices of the submatrix
xl= x-w;
xu= x+w;
yl= y-w;
yu= y+w;
if xl<1 
    xl= 1;
elseif xu>a
    xu=a;
end
if yl<1
    yl=1;
elseif yu>b
    yu=b;
end
indices = [xl xu yl yu];
