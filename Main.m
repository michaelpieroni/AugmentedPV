function varargout = Main(varargin)
% MAIN M-file for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 10-Oct-2014 08:33:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% Initialize Experimental Condition

% End initialization code - DO NOT EDIT


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
initialize_gui(hObject, eventdata, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.Main);




% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%H e K vengono utilizzati come passo di campionamento per il passaggio tra
% pixel e mm

function data = initialize_gui(hObject, eventdata, handles)
% % Inizialize the variables and set the text to zero

    set(handles.text_eler,'String',num2str(0));
    set(handles.text_elec,'String',num2str(0));
    set(handles.text_dim,'String',num2str(0));
    set(handles.text_disp,'String',num2str(0));
    set(handles.text_sp,'String',num2str(0));
    set(handles.text_tr,'String',num2str(0));
    set(handles.text_mpr,'String',' ');
    set(handles.text_mph,'String',' ');
    set(handles.text_ty,'String',' ');
    set(handles.text_phr,'String',num2str(0));
    set(handles.text_phc,'String',num2str(0));
    set(handles.text_h,'String',num2str(0));
    set(handles.text_k,'String',num2str(0));
    
    
    
    
% PERMETTE DI FAR SCORRERE IL VIDEO UN FRAME ALLA VOLTA
% obj = mmreader ( 'c: \ vid \ Akiyo.mp4' ); 
% nFrames = obj . NumberOfFrames , 
% per k = 1 : nFrames
%     img = read ( obj , k ); 
%     figura ( 1 ), imshow ( IMG , []); 
% end

function update_gui(hObject, eventdata, handles,varargin)

    dati = varargin{1};
    set(handles.text_eler,'String',dati.numel_r);
    set(handles.text_elec,'String',dati.numel_c);
    set(handles.text_dim,'String',dati.dim);
    set(handles.text_disp,'String',dati.disposition);
    set(handles.text_sp,'String',dati.r_space);
    set(handles.text_tr,'String',dati.r_time);
    set(handles.text_phr,'String',dati.numph_r);
    set(handles.text_phc,'String',dati.numph_c);
    set(handles.text_h,'String',dati.k);
    set(handles.text_k,'String',dati.h);
    set(handles.text_ty,'String',dati.type_map);
    set(handles.text_mpr,'String',dati.modul_prot);
    set(handles.text_mph,'String',dati.modul_phos);
    
    
% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
    %
    % TODO: Get the parameters for the simulation of Phosphenated Vision
    % At the moment use the following parameters
    % Data for electrode
    data.ele_c = 10;
    data.ele_r = 10;
    data.dim_elec = 10; %um
    data.r_space = 0;
    data.r_time = 0;
    data.h = 10;
    data.k = 10;
    %Data for phosphene
    data.phos_r = 10;
    data.phos_c = 10;
    data.mod_phos = '';
    data.disposition ='';
    data.mod_prot = '';
    data.type_map = '';

    box_margin{1} = data.ele_c;
    box_margin{2} = data.ele_r;
    box_margin{3} = data.phos_r;
    box_margin{4} = data.phos_c;
    
    %% GET the 'right' input data
    
    % TODO: import a filename and a filepath
    % At the moment use the default video 'videoprova.avi'
    
    if not(exist(vidobj))
        vidobj = VideoReader('videoprova.avi');
    end
    % Get same input data parameters
%     nof = vidobj.NumberOfFrames; %number of frame for the overall video
    nof = get(vidobj,'NumberOfFrames'); %number of frame for the overall video
    
    nof_new=10;
    vidobj = set(vidobj,'NumberOfFrames'); %number of frame for the overall video
    
    % Add other data: bitsperpixel, width ,height.....
    
    % Convert VideoFormat to GrayScale
    
    
    %% SEE the example at....
    
    %http://www.mathworks.com/help/vision/ref/vision.videofilereader-class.html
    
    
    vid = vidobj(:,:,:);
    for i=1:nof
        [M(:,:,i)]=spvmain(vid(:,:,i),dati.type_map,dati.modul_prot,dati.h,dati.k,box_margin); 
    end;
    x = permute(M,[1 2 4 3 ]);  
    mplay(x); 
    
    
% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)


% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)


% --- Executes on button press in x2.
function x2_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Edit_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Sel_ImVid_Callback(hObject, eventdata, handles)
    Select()


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function Control_Panel_Callback(hObject, eventdata, handles)
 date= ins_data(handles);
 
  

% --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
    
    box_margin{1} = date_numel_r;
    box_margin{2} = dati.numel_c;
    box_margin{3} = date.numph_r;
    box_margin{4} = date.numph_c;
    
    %spvmain( M,handles.date.type_map, handles.date.mod_phos , handles.date.h, handles.date.k,box_margins )
    %
%     guidata(object_handle,handles.data)


