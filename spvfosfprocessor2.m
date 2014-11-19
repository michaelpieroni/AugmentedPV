function [ amplitude,intensity ] = spvfosfprocessor2( im,ch,type_map,h,k,dim_phos, varargin )
%prende in ingresso la mappa di fosfeni, l'immagine,  un char ovvero ch che
%puo essere inte, amp o intamp. nel caso uniform varargin conterra r,c
%ovvero le righe e le colonne di ogni fosfene.
%INPUT
%
%
%
%
%

% if varargin{1} exist-> zoom
r_mp=dim_phos{1};
c_mp=dim_phos{2};
rmp=dim_phos{3};
cmp=dim_phos{4};



% Check if all the image contributes on the electrode signal or 
% just a Region of Interest will be renderized

if nargin>6 %% TO BE CHECKED 
    %ZOOM : da IMPLEMENTARE
    error ('Zoom into the image is not already implemented!!! TODO ')
else
    imROI=im; 
end


switch(type_map)
    case{'Uniform'}
        r_imP=size(imROI,1); % num row in the image ROI(region of interest)
        c_imP=size(imROI,2); % num row in the image ROI(region of interest)
        
        % For row
        D_r=r_imP/r_mp;
        sD_r=D_r/2;
        coord_r=sD_r:D_r:r_imP;
        
        % For colunm
        D_c=c_imP/c_mp;
        sD_c=D_c/2;
        coord_c=sD_c:D_c:c_imP;
        
%        imA=imPort(vett_r,vett_c);
        %CHECK about phosphene coordinate dimension
        if not(length(coord_c)==length(coord_r))
            error('phosphene coordinate do not match in row and column')
        end

        %Mapping of the phosphenes in the image/ROI 
        vett_r=linspace(0,r_imP,r_mp+1); % vector for row
        vett_c=linspace(0,c_imP,c_mp+1); % vector for column
      
        switch(ch)
            case('Amplitude')
                for np_c=2:length(vett_c)
                    for np_r=2:length(vett_r)
                        ind_c=vett_c(np_c-1)+1:vett_c(np_c);
                        ind_r=vett_r(np_r-1)+1:vett_r(np_r);
                        imWind=imROI(floor(ind_r),floor(ind_c));
                        amplitude(np_r-1,np_c-1)=std(std(imWind));
                    end                     
                end
                %then intensity to ones
                intensity=ones(length(coord_r),length(coord_c));
%                warning ('Check window dimension!! amplitude not  consistent!!!')
                varargout{1}=amplitude;
                varargout{2}=intensity;

           case('Intensity')
                for np_c=2:length(vett_c)
                    for np_r=2:length(vett_r)
                        ind_c=vett_c(np_c-1)+1:vett_c(np_c);
                        ind_r=vett_r(np_r-1)+1:vett_r(np_r);
                        imWind=imROI(floor(ind_r),floor(ind_c));
                        intensity(np_r-1,np_c-1)=mean(mean(imWind));
                    end                     
                end
                %then intensity to ones
                amplitude=ones(length(coord_r),length(coord_c));
                warning ('Check window dimension!! intensity not  consistent!!!')
                varargout{1}=amplitude;
                varargout{2}=intensity;

           case('& Amplitude-Intensity')
                for np_c=2:length(vett_c)
                    for np_r=2 : length(vett_r)
                        ind_c = vett_c(np_c-1)+1:vett_c(np_c);
                        ind_r = vett_r(np_r-1)+1:vett_r(np_r);
                        imWind = imROI(floor(ind_r),floor(ind_c));
                        amplitude(np_r-1,np_c-1) = std(std(imWind));
                        intensity(np_r-1,np_c-1) = mean(mean(imWind));
                    end                     
                end
                %then intensity to ones
%                 intensity=ones(length(coord_r),length(coord_c));
%                 warning ('Check window dimension!! amplitude not  consistent!!!')
                varargout{1}=amplitude;
                varargout{2}=intensity;
        end
        
    case('Not Uniform')
        error ('Not uniform is not already implemented')
        
end















% % Scaling between Phoshene Map and Image
% K_r=rim/rmp; %along th row : Map of Phosphene/Image
% K_c=cim/cmp; %along th column : Map of Phosphene/Image
% 
% [x,y]=find(map); % trova le coordinate dei fosfeni
% im=double(im);
% amplitude=h*ones(length(x),1); %crea il vettore dell'ampiezza moltiplicato per un parametro imposto dall'utente
% intensity=k*ones(length(x),1); %crea il vettore dell'intensità moltiplicato per un parametro scelto dall'utente
% tmp=max(std(im));
% switch(type_map)
%     case{'Uniform'}
%         d=2*min(r,c);
%         lr=round(r*rim/rmp);
%         lc=round(c*cim/cmp);
%         switch(ch)
%             case('Amplitude')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rmp);
%                     yp=round(y(i)*cim/cmp);
% %                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 intensity=k*ones(length(x),1);
%                 amplitude=amplitude*d/tmp;
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rmp);
%                     yp=round(y(i)*cim/cmp);
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 amplitude=h*ones(length(x),1);
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('& Amplitude-Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rmp);
%                     yp=round(y(i)*cim/cmp);
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 amplitude=amplitude*d/tmp;
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%         end
%     case('Not Uniform')
%         dr=varargin{1};
%         dc=varargin{2};
%         d=varargin{3};
%         lr=round((d-1)*rim/rm);
%         lc=round((d-1)*cim/cm);
%         switch(ch)
%             case('Amplitude')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 intensity=k*ones(length(x),1);
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 amplitude=h*ones(length(x),1);
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%            case('& Amplitude-Intensity')
%                 for i=1:length(x)
%                     xp=round(x(i)*rim/rm);
%                     yp=round(y(i)*cim/cm);
%                     amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                     intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
%                 end
%                 varargout{1}=amplitude;
%                 varargout{2}=intensity;
%         end
%         
% end
% end

