function [PSNRvector,SSIMvector,FSIMvector, SAMvector,ERGASvector] = evaluate(OriData3,output_image,M,N)
p = size(OriData3,3);
PSNRvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);

    I=255*output_image(:,:,i);

      PSNRvector(1,i)=PSNR(J,I,M,N);
end
% dlmwrite('PSNRvector.txt',PSNRvector,'delimiter','\t','newline','pc');
% 
PSNRvec = mean(PSNRvector);
SSIMvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);
%     Jnoise=oriData3_noise(:,:,i);
    I=255*output_image(:,:,i); 
%      [ SSIMnoisevector(1,i),ssim_map] = ssim(J,Jnoise);
      [ SSIMvector(1,i),ssim_map] = ssim(J,I);
end

SSIMvec=mean(SSIMvector);
% dlmwrite('SSIMvector.txt',SSIMvector,'delimiter','\t','newline','pc');
FSIMvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);
%     Jnoise=oriData3_noise(:,:,i);
    I=255*output_image(:,:,i); 
%      [ SSIMnoisevector(1,i),ssim_map] = ssim(J,Jnoise);
      [ FSIMvector(1,i),fsim_map] = FeatureSIM(J,I);
end

ERGASvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);
%     Jnoise=oriData3_noise(:,:,i);
    I=255*output_image(:,:,i); 
%      [ SSIMnoisevector(1,i),ssim_map] = ssim(J,Jnoise);
      [ ERGASvector(1,i)] = ErrRelGlobAdimSyn(J,I);
end

SAMvector=zeros(1,p);
for i=1:1:p
    J=255*OriData3(:,:,i);
%     Jnoise=oriData3_noise(:,:,i);
    I=255*output_image(:,:,i); 
%      [ SSIMnoisevector(1,i),ssim_map] = ssim(J,Jnoise);
      [ SAMvector(1,i)] = SpectAngMapper(J,I);
end
