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

% Last Modified by GUIDE v2.5 24-Sep-2014 16:00:16

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
initialize_gui(handles);
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

function initialize_gui(handles)
    handles.date.num_elec = 0;
    handles.date.dim_elec = 0;
    handles.date.r_space = 0;
    handles.date.r_time = 0;
    handles.date.mod_phos = '';
    handles.date.disposition ='';
    handles.date.mod_prot = '';
    handles.date.type_map = '';
    guidata(handles.Main,handles);
    
% PERMETTE DI FAR SCORRERE IL VIDEO UN FRAME ALLA VOLTA
% obj = mmreader ( 'c: \ vid \ Akiyo.mp4' ); 
% nFrames = obj . NumberOfFrames , 
% per k = 1 : nFrames
%     img = read ( obj , k ); 
%     figura ( 1 ), imshow ( IMG , []); 
% end

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)


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
  ins_data()
  

% --- Executes on button press in Import.
function Import_Callback(hObject, eventdata, handles)
    set
    box_margin{1} = handles.date.num_elec_r;
    box_margin{2} = handles.date.num_elec_c;
    box_margin{3} = handles.date.num_phos_r;
    box_margin{4} = handles.date.num_phos_c;
    
    %spvmain( M,handles.date.type_map, handles.date.mod_phos , handles.date.h, handles.date.k,box_margins )
    
    guidata(object_handle,handles.data)


