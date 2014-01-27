
Im = img;
Im=double(Im);
step_x=floor(C/(nwin_x+1));
step_y=floor(L/(nwin_y+1));
cont=0;
hx = [-1,0,1];
hy = -hx';
grad_xr = imfilter(double(Im),hx);
grad_yu = imfilter(double(Im),hy);
angles=atan2(grad_yu,grad_xr);
magnit=((grad_yu.^2)+(grad_xr.^2)).^.5;

imshow(magnit);

n = size(magnit, 1);
m = size(magnit, 2);
for i=10:3:n-10
    for j=10:3:m-10
        mag = magnit(i, j);
        ag = angles(i, j);
        if (mag > 0.2)
            dx = cos(ag) * mag * 50;
            dy = sin(ag) * mag * 50;
            line([j j+dx], [i i+dy]);
        end
    end
end