function varargout = mma1(varargin)
% MMA1 MATLAB code for mma1.fig
%      MMA1, by itself, creates a new MMA1 or raises the existing
%      singleton*.
%
%      H = MMA1 returns the handle to a new MMA1 or the handle to
%      the existing singleton*.
%
%      MMA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MMA1.M with the given input arguments.
%
%      MMA1('Property','Value',...) creates a new MMA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mma1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mma1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mma1

% Last Modified by GUIDE v2.5 18-Mar-2019 13:24:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mma1_OpeningFcn, ...
                   'gui_OutputFcn',  @mma1_OutputFcn, ...
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


% --- Executes just before mma1 is made visible.
function mma1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mma1 (see VARARGIN)

% Choose default command line output for mma1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mma1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mma1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im im2
[path,user_cance] = imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error')
    return
end
im= imread(path);
im = im2double(im);
im2 = im
axes(handles.axes1);
imshow(im);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2
axes(handles.axes1);
imshow(im2);




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global R G B;
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,2);
imgray=(0.2989 *R + 0.5870 * G + 0.1140 * B);
axes(handles.axes1);
imshow(imgray);




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
global im;
global R G B;
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,2);
imgray=(0.2989 *R + 0.5870 * G + 0.1140 * B);
imd = double(imgray);
[m,n] = size(imd);

gamma = 0.5;
out = abs((1*imd).^gamma);

maxm = max(out(:));
minm = min(out(:));
for i=1:m
    for j=1:n
        out(i,j) = (255*out(i,j))/(maxm-minm);
    end
end
out = uint8(out);
axes(handles.axes1);
imshow(out);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global im;
global R G B;
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,2);
imgray=(0.2989 *R + 0.5870 * G + 0.1140 * B);
imd = double(imgray);
[m,n] = size(imd);

gamma = 2.2;
out = abs((1*imd).^gamma);

maxm = max(out(:));
minm = min(out(:));
for i=1:m
    for j=1:n
        out(i,j) = (255*out(i,j))/(maxm-minm);
    end
end
out = uint8(out);
axes(handles.axes1);
imshow(out);q


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
