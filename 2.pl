% =========================================================
% 1. FAKTA FRAME (Versi Lebih Manusiawi & Logis)
% =========================================================

% Level 1: Makhluk Hidup (Superclass paling atas)
frame(makhluk_hidup, [
    has(tulang_belakang)   % Semua makhluk hidup vertebrata punya ini
]).

% Level 2: Manusia (Subclass dari makhluk hidup)
frame(manusia, [
    isa(makhluk_hidup),
    has(akal_budi)         % Atribut khusus manusia
]).

% Level 3: Pria (Subclass dari manusia)
frame(pria, [
    isa(manusia),
    gender(laki_laki)
]).

% Level 4: Instance (Objek spesifik)
frame(john, [
    isa(pria),
    has(car_01)
]).

% Frame Mobil
frame(car_01, [
    owner(john),
    color(red),
    type('RV'),
    engine('2.0l DOHC'),
    made_in('Indonesia')
]).

% =========================================================
% 2. RULE PEWARISAN (INHERITANCE) - Tetap sama persis!
% =========================================================

% Rule 1: Cek Kepemilikan Langsung
memiliki(Objek, Benda) :-
    frame(Objek, DaftarSlot),
    member(has(Benda), DaftarSlot).

% Rule 2: Cek Kepemilikan Turunan (Inheritance lewat 'isa')
memiliki(Objek, Benda) :-
    frame(Objek, DaftarSlot),
    member(isa(Induk), DaftarSlot), 
    memiliki(Induk, Benda).