function varargout = demo1(varargin)
% DEMO1 MATLAB code for demo1.fig
%      DEMO1, by itself, creates a new DEMO1 or raises the existing
%      singleton*.
%
%      H = DEMO1 returns the handle to a new DEMO1 or the handle to
%      the existing singleton*.
%
%      DEMO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO1.M with the given input arguments.
%
%      DEMO1('Property','Value',...) creates a new DEMO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo1

% Last Modified by GUIDE v2.5 09-May-2020 16:40:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo1_OpeningFcn, ...
                   'gui_OutputFcn',  @demo1_OutputFcn, ...
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


% --- Executes just before demo1 is made visible.
function demo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo1 (see VARARGIN)

% Choose default command line output for demo1
handles.output = hObject;
handles.pb0=[];


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb1.
function pb1_Callback(hObject, eventdata, handles)
% hObject    handle to pb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*697*n/8192)+sin(2*pi*1209*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'1'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);



% --- Executes on button press in pb2.
function pb2_Callback(hObject, eventdata, handles)
% hObject    handle to pb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*697*n/8192)+sin(2*pi*1336*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'2'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);


% --- Executes on button press in pb3.
function pb3_Callback(hObject, eventdata, handles)
% hObject    handle to pb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*697*n/8192)+sin(2*pi*1477*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'3'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb4.
function pb4_Callback(hObject, eventdata, handles)
% hObject    handle to pb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*770*n/8192)+sin(2*pi*1209*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'4'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb5.
function pb5_Callback(hObject, eventdata, handles)
% hObject    handle to pb5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*770*n/8192)+sin(2*pi*1336*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'5'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb6.
function pb6_Callback(hObject, eventdata, handles)
% hObject    handle to pb6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*770*n/8192)+sin(2*pi*1477*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'6'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb7.
function pb7_Callback(hObject, eventdata, handles)
% hObject    handle to pb7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*852*n/8192)+sin(2*pi*1209*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'7'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);


% --- Executes on button press in pb8.
function pb8_Callback(hObject, eventdata, handles)
% hObject    handle to pb8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*852*n/8192)+sin(2*pi*1336*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'8'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb9.
function pb9_Callback(hObject, eventdata, handles)
% hObject    handle to pb9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*852*n/8192)+sin(2*pi*1477*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'9'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb10.
function pb10_Callback(hObject, eventdata, handles)
% hObject    handle to pb10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*941*n/8192)+sin(2*pi*1209*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'*'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb0.
function pb0_Callback(hObject, eventdata, handles)
% hObject    handle to pb0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*941*n/8192)+sin(2*pi*1336*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'0'); % ???????????? 
set(handles.numshow,'string',newnum); % ???????? 
sound(d,8192); % ??????????
guidata(hObject,handles);

% --- Executes on button press in pb12.
function pb12_Callback(hObject, eventdata, handles)
% hObject    handle to pb12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % ???????? 410 ????????????
d=sin(2*pi*941*n/8192)+sin(2*pi*1477*n/8192); % ????????????????
space = zeros(1,410);%410??0????????
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'#'); % ???????????? 

set(handles.numshow,'string',newnum); % ???????? 

sound(d,8192); % ??????????
guidata(hObject,handles);


% --- Executes on button press in pbf.
function pbf_Callback(hObject, eventdata, handles)
% hObject    handle to pbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num = get(handles.numshow,'string');% ?????????????????????? 
L   = length(num);%????????????????????
nll = strrep(num,num,num(1:L-1));%??????L-1??????
set(handles.numshow,'string',nll); % ????????

clear num(L);

n   = [1:410];
dll = sin(0.7217*n)+sin(0.9273*n);
sound(dll,8192);%??????????????????????
guidata(hObject,handles);

% --- Executes on button press in pbs.
function pbs_Callback(hObject, eventdata, handles)
% hObject    handle to pbs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[pyr,fs]=audioread(handles.filenames);%????????

sound(pyr,fs);   %????????

N=length(pyr); %??????????
figure(6);
subplot(2,1,1);
plot(pyr); %??????????????
cattch=[];
i=1;

while(i<N-10)
        i=i+1;
    if(max([pyr(i),pyr(i+1),pyr(i+2),pyr(i+3),pyr(i+4),pyr(i+5)])>0.08)
        cattch=[cattch,i];
        i=i+5000;
    end

end

N1=length(cattch);
newnum=[];
cap=['1','2','3';'4','5','6';'7','8','9';'*','0','#'];
fprintf("%d\n",N1);

for (k=1:N1)
    
    f=fft(pyr(cattch(k)-410:cattch(k)+410),fs);%??FFT???? d??????????????????????????
    a=abs(f);
    p=a.*a/fs; % ??????????
    num(1)=find(p(1:1000)==max(p(1:1000))); % ?????? 
    num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % ??????
    if (num(1) < 730)
        row=1; % ????????
    elseif (num(1) < 810)
        row=2;
    elseif (num(1) < 900)
        row=3;
    else  
        row=4;
    end

    if (num(2) < 1270)
        col=1; % ????????
    elseif (num(2) < 1400)
        col=2;
    else
        col=3; 
    end
     fprintf("%d\n",num(1),num(2));
    newnum=strcat(newnum,cap(row,col));
end
set(handles.text3,'string',newnum);
guidata(hObject,handles);


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname,Filterinfdex]= uigetfile('.m4a');
handles.filenames= strcat(pathname,filename);
guidata(hObject,handles);


% --- Executes on button press in comsb.
function comsb_Callback(hObject, eventdata, handles)
% hObject    handle to comsb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


N=length(handles.pb0);
count=N/820;%????????????????????
newnum=[];
cap=['1','2','3';'4','5','6';'7','8','9';'*','0','#'];
for i=1:count%???? count ??????
    d=handles.pb0(1+820*(i-1):820*i);%??????????????????????
    f=fft(d,8192);%??FFT???? d??????????????????????????
    a=abs(f);
    p=a.*a/8192; % ??????????
    num(1)=find(p(1:1000)==max(p(1:1000))); % ?????? 
    num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % ??????
    if (num(1) < 730)
        row=1; % ????????
    elseif (num(1) < 810)
        row=2;
    elseif (num(1) < 900)
        row=3;
    else  
        row=4;
    end

    if (num(2) < 1270)
        col=1; % ????????
    elseif (num(2) < 1400)
        col=2;
    else
        col=3; 
    end
     fprintf("%d\n",num(1),num(2));
    newnum=strcat(newnum,cap(row,col));
end
set(handles.text3,'string',newnum);
guidata(hObject,handles);
