function [ map,varargout ] = spvfosfmap( type_map,varargin )
%r,c dimensione della mappa di fosfeni
%type_map tipo di mappa ho usato solo 2 casi uniform ovvero fosfeni
%uniformemente distribuiti in questo caso varargin prende in ingresso fr
%e fc rispettivamente le righe di fosfeni che voglio e le colonne, e anche
%il numero di righe e di colonne per ogni fosfene rispettivamente r,c. 

switch (type_map)
    case('uniform')
        fr=varargin{1}; %numero di fosfeni per riga
        fc=varargin{2}; %numero di fosfeni per colonna
        r=varargin{3};  %nuero di righe
        c=varargin{4};  %numero di colonne
        rm=fr*(2*r+1);  %mi calcolo il numero dirighe della mappa di fosfeni
        cm=fc*(2*c+1);  %mi calcolo il numero di colonne della mappa di fosfeni
        map=sparse(rm,cm);  %creo la mappa di fosfeni come matrice sparsa
        map((r+1:2*r+1:rm-r),(c+1:2*c+1:cm-c))=1; %metto 1 in corrispondenza dell fosfene
        varargout{1}=r; 
        varargout{2}=c;
    case ('notuniform')
        n=varargin{1}; %numero di fosfeni
        r=varargin{2}; %numero di righe della mappa di fosfeni
        c=varargin{3}; %numero di colonne della mappa di fosfeni
        axis([1 r 1 c]) % setta gli assi
        map=sparse(r,c); % crea una mappa di fosfeni sparsa
        figure(1),grid minor; %genera il grafico con un griglia fine
        [x,y]=ginput(n); % comando che permette di selezionare i punti dal mouse
        close(1); %chiude la finestra 1
        x=round(x); 
        y=round(y);
        for i=1:n
           map(c-y(i),x(i))=1; % viene posto a 1 la posizione del fosfene
        end
        dr=min(min(x,r-x)); %rppresenta il minimo del vettore delle ascisse 
        dc=min(min(y,c-y)); %rappresenta il minimo del vettore delle ordinate
        d=min(dr,dc); %rappresenta la distanza minima
        varargout{1}=dr;
        varargout{2}=dc;
        varargout{3}=d;
end


end

