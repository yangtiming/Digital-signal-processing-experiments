function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value paiAs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI alloWs only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 16-Jun-2020 19:11:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

guidata(hObject, handles);
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname,Filterinfdex]= uigetfile('.m4a');
handles.filenames= strcat(pathname,filename);
set(handles.text3,'string',handles.filenames); % 显示路径
guidata(hObject,handles);


function edit02_Callback(hObject, eventdata, handles)
% hObject    handle to edit02 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit02 as text
%        str2double(get(hObject,'String')) returns contents of edit02 as a double


% --- Executes during object creation, after setting all properties.
function edit02_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit02 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on WindoWs.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs;
global m0;
    
sound(m0,fs);   %声音回放

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pyr;
global fs;
global t;
global f;

[pyr1,fs]=audioread(handles.filenames);%声音读取
L=length(pyr1);
noise=0.1*randn(L,str2num(get(handles.edit_zaos,'String')));  %产生等长度的随机噪声信号(这里的噪声的大小取决于随机函数的幅度倍数）
%低频噪声产生
        Ap=2;As=15;
        Fs=10000;
        wp=2500*2/Fs; ws=1500*2/Fs;
        [N,Wn]=buttord(wp,ws,Ap,As);  %计算巴特沃斯滤波器阶次和截止频率
        [B,A]=butter(N,Wn,'high');    %频率变换法设计巴特沃斯高通滤波器
        [H,W]=freqz(B,A,256,Fs);      %数字滤波器响应
        noise_high=filter(B,A,noise); %m0是滤波器滤波后的信号
%低频噪声产生
        Ap=3;As=20;
        Fs=10000;
        wp=2500*2/Fs; ws=1500*2/Fs;
        [N,Wn]=buttord(wp,ws,Ap,As);  %计算巴特沃斯滤波器阶次和截止频率
        [B,A]=butter(N,Wn,'low');    %频率变换法设计巴特沃斯高通滤波器
        [H,W]=freqz(B,A,256,Fs);      %数字滤波器响应
        noise_low=filter(B,A,noise); %m0是滤波器滤波后的信号


if get(handles.radiobutton1,'Value')==1 
    if get(handles.radiobutton4,'Value')==1 
     pyr =pyr1+noise_high;
    end
    if get(handles.radiobutton5,'Value')==1 
     pyr =pyr1+noise_low;
    end
 else 
        pyr=pyr1;
end
sound(pyr,fs);   %声音回放

t = [0:1/fs:(length(pyr)-1)/fs];%信号的时域长度 
subplot(handles.axes1);
N = length(t);
fftdata = fft(pyr,N);
plot(handles.axes1,t,pyr);
fdata = abs(fftdata);
df = fs / N;
f = [0 : df : df * (N - 1)] - fs / 2;%求频率
subplot(handles.axes3);
plot(f, fftshift(fdata) );

guidata(hObject, handles);
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global pyr;
global t;
global fs;
global f;
global m0;
choice=get(handles.popupmenu1,'Value');
        N=length(t);
        Ap=str2num(get(handles.edit06,'String'));
        As=str2num(get(handles.edit08,'String'));
        Fs=str2num(get(handles.edit091,'String'));
        Wp=str2num(get(handles.edit02,'String'))*2/Fs; 
        Ws=str2num(get(handles.edit04,'String'))*2/Fs;
switch choice
    case 1
        %低通巴特沃斯滤波器

        [N,Wn]=buttord(Wp,Ws,Ap,As);  %计算巴特沃斯滤波器阶次和截止频率
        [B,A]=butter(N,Wn,'low');    %频率变换法设计巴特沃斯高通滤波器
        [H,W]=freqz(B,A,256,Fs);      %数字滤波器响应
        m0=filter(B,A,pyr); %m0是滤波器滤波后的信号
    case 2
        %高通巴特沃斯滤波器

        [N,Wn]=buttord(Wp,Ws,Ap,As);  %计算巴特沃斯滤波器阶次和截止频率
        [B,A]=butter(N,Wn,'high');    %频率变换法设计巴特沃斯高通滤波器
        [H,W]=freqz(B,A,256,Fs);      %数字滤波器响应
        m0=filter(B,A,pyr); %m0是滤波器滤波后的信号
    case 3
        %低通切比雪夫滤波器        
        [N,Wn]=cheb1ord(Wp,Ws,Ap,As);
        [B,A]=cheby1(N,Ap,Wn,'low');
        [H,W]=freqz(B,A,256,Fs);
         m0=filter(B,A,pyr); %m0是滤波器滤波后的信号
    case 4
        %高通切比雪夫滤波器 
        
        [N,Wn]=cheb1ord(Wp,Ws,Ap,As);
        [B,A]=cheby1(N,Ap,Wn,'high');
        [H,W]=freqz(B,A,256,Fs);
         m0=filter(B,A,pyr); %m0是滤波器滤波后的信号
        
end
     if get(handles.radiobutton3,'Value')==1;
          audiowrite('.//sounds_results.wav',m0,fs)
     end
        
        plot(handles.axes7,W/pi,20*log10(abs(H)));
        title(handles.axes7,'滤波器波形');
        Yk = fft(m0);
        plot(handles.axes2,t,m0);
        set(handles.axes2,'YLim');
        title(handles.axes2,'解调时域波形');
        plot(handles.axes4,f,fftshift(abs(Yk)));
        title(handles.axes4,'解调幅度谱');
       

 guidata(hObject, handles); 
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on WindoWs.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future veAsion of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on WindoWs.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit04_Callback(hObject, eventdata, handles)
% hObject    handle to edit04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit04 as text
%        str2double(get(hObject,'String')) returns contents of edit04 as a double


% --- Executes during object creation, after setting all properties.
function edit04_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit04 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit06_Callback(hObject, eventdata, handles)
% hObject    handle to edit06 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit06 as text
%        str2double(get(hObject,'String')) returns contents of edit06 as a double


% --- Executes during object creation, after setting all properties.
function edit06_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit06 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


guidata(hObject, handles);
function edit08_Callback(hObject, eventdata, handles)
% hObject    handle to edit08 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit08 as text
%        str2double(get(hObject,'String')) returns contents of edit08 as a double

guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function edit08_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit08 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


guidata(hObject, handles);
function edit091_Callback(hObject, eventdata, handles)
% hObject    handle to edit091 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit091 as text
%        str2double(get(hObject,'String')) returns contents of edit091 as a double


% --- Executes during object creation, after setting all properties.
function edit091_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit091 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

guidata(hObject, handles);

function edit010_Callback(hObject, eventdata, handles)
% hObject    handle to edit010 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit010 as text
%        str2double(get(hObject,'String')) returns contents of edit010 as a double

guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function edit010_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit010 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


guidata(hObject, handles);
function edit011_Callback(hObject, eventdata, handles)
% hObject    handle to edit011 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit011 as text
%        str2double(get(hObject,'String')) returns contents of edit011 as a double

guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function edit011_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit011 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_zaos_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zaos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zaos as text
%        str2double(get(hObject,'String')) returns contents of edit_zaos as a double


% --- Executes during object creation, after setting all properties.
function edit_zaos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zaos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject, handles);
% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

guidata(hObject, handles);
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
guidata(hObject, handles);

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
guidata(hObject, handles);