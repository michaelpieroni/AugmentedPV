b=input('inseisci b ');
fr=64;
fc=64;
r=5;
c=5;
for i=1:10
    [M(:,:,i)]=spvmain(b(:,:,i),'uniform','ampiezza',1,1,fr,fc,r,c); %fosfenizza tutt le immagini
    
end
x=permute(M,[1 2 4 3 ]); %pemuta la quarta con la terza dimensione 
mplay(x); %manda a video x