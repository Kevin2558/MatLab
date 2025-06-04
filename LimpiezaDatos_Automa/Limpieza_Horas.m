% Cadena de fecha en formato ISO 8601
str = '2025-05-30T18:22:41.298Z';

% Convertir a datetime (el formato Z indica UTC)
dt = datetime(str, 'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z''', 'TimeZone', 'UTC');

% Extraer partes
hora = hour(dt);
minuto = minute(dt);
segundo = second(dt);

% Mostrar
disp(['Hora: ', num2str(hora)])
disp(['Minuto: ', num2str(minuto)])
disp(['Segundo: ', num2str(segundo)])

%%
T = readtable('data_XY_lento_3_794234.csv');

% Convertir columna de tiempo a datetime
dt = datetime(T{:,1},'InputFormat', 'yyyy-MM-dd''T''HH:mm:ss.SSS''Z''', 'TimeZone', 'UTC');
dt.Format = 'mm:ss.SSS';  % Solo para visualización

% La tabla venia con formato y lo que queremos hacer es transformar la
% la columna de la fecha en una que solo entregue los segundos que van
% pasando.

T2 = zeros(200,1);
for i = 2:200
    T2(i) = seconds(dt(i) - dt(1));
end
T.timestamp = T2;

% Solucion a un problema de visualizacion la cata

T.Output = -T{:,2};
t = T{:,1};
% Se le resta la media para que se centre en 0
y1 = T{:,2} - mean(T{:,2});
y2 = T{:,3} - mean(T{:,3});

hold on
plot(t,y1)
plot(t,y2)
hold off