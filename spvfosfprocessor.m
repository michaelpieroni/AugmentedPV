function [ amplitude,intensity ] = spvfosfprocessor( map,im,ch,type_map,h,k,rim,cim,dim_phos )
%prende in ingresso la mappa di fosfeni, l'immagine,  un char ovvero ch che
%puo essere inte, amp o intamp. nel caso uniform varargin conterra r,c
%ovvero le righe e le colonne di ogni fosfene.
r=dim_phos{1};
c=dim_phos{2};
rm=dim_phos{3};
cm=dim_phos{4};
[x,y]=find(map); % trova le coordinate dei fosfeni
im=double(im);
amplitude=h*ones(length(x),1); %crea il vettore dell'ampiezza moltiplicato per un parametro imposto dall'utente
intensity=k*ones(length(x),1); %crea il vettore dell'intensità moltiplicato per un parametro scelto dall'utente
tmp=max(std(im));
switch(type_map)
    case{'Uniform'}
        d=2*min(r,c);
        lr=round(r*rim/rm);
        lc=round(c*cim/cm);
        switch(ch)
            case('Amplitude')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                    
                end
                intensity=k*ones(length(x),1);
                amplitude=amplitude*d/tmp;
                varargout{1}=amplitude;
                varargout{2}=intensity;
           case('Intensity')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                end
                amplitude=h*ones(length(x),1);
                varargout{1}=amplitude;
                varargout{2}=intensity;
           case('& Amplitude-Intensity')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                    intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                end
                amplitude=amplitude*d/tmp;
                varargout{1}=amplitude;
                varargout{2}=intensity;
        end
    case('Not Uniform')
        dr=varargin{1};
        dc=varargin{2};
        d=varargin{3};
        lr=round((d-1)*rim/rm);
        lc=round((d-1)*cim/cm);
        switch(ch)
            case('Amplitude')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                end
                intensity=k*ones(length(x),1);
                varargout{1}=amplitude;
                varargout{2}=intensity;
           case('Intensity')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                end
                amplitude=h*ones(length(x),1);
                varargout{1}=amplitude;
                varargout{2}=intensity;
           case('& Amplitude-Intensity')
                for i=1:length(x)
                    xp=round(x(i)*rim/rm);
                    yp=round(y(i)*cim/cm);
                    amplitude(i)=std(std(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                    intensity(i)=mean(mean(im(xp-lr:xp+lr,yp-lc:yp+lc)));
                end
                varargout{1}=amplitude;
                varargout{2}=intensity;
        end
        
end
end

