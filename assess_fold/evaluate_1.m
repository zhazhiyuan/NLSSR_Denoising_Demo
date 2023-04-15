function [PSNRvector] = evaluate_1(OriData3,output_image,M,N)
p = size(OriData3,3);
PSNRvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);

    I=255*output_image(:,:,i);

      PSNRvector(1,i)=PSNR(J,I,M,N);
end
% dlmwrite('PSNRvector.txt',PSNRvector,'delimiter','\t','newline','pc');
