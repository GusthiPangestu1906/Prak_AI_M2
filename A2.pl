% Frame untuk Budi: IPK rendah, kehadiran sangat kurang
frame(budi, [
    ipk(1.8), 
    kehadiran(60)
]).

% Frame untuk Siti: IPK aman, tapi sering bolos
frame(siti, [
    ipk(2.5), 
    kehadiran(50)
]).

% Frame untuk Joko: IPK mepet, kehadiran mepet
frame(joko, [
    ipk(2.0), 
    kehadiran(75)
]).

% Frame untuk Gusthi: IPK tinggi, rajin (Aman)
frame(gusthi, [
    ipk(3.9), 
    kehadiran(95)
]).


% =========================================================
% 2. RULE & 3. KESIMPULAN (Reasoning)
% Mengambil data dari dalam "Slot" di Frame untuk ditarik kesimpulan
% =========================================================

% Rule 1: Kesimpulannya "DO Kritis" 
% JIKA di dalam frame-nya, IPK kurang dari 2.0 DAN Kehadiran kurang dari 75
kesimpulan_do(Nama, 'DO Kritis') :-
    frame(Nama, DaftarSlot),
    member(ipk(NilaiIPK), DaftarSlot), NilaiIPK < 2.0,
    member(kehadiran(NilaiHadir), DaftarSlot), NilaiHadir < 75.

% Rule 2: Kesimpulannya "Waspada DO" 
% JIKA IPK-nya aman (>= 2.0) TAPI kehadirannya bermasalah (< 75)
kesimpulan_do(Nama, 'Waspada DO') :-
    frame(Nama, DaftarSlot),
    member(ipk(NilaiIPK), DaftarSlot), NilaiIPK >= 2.0,
    member(kehadiran(NilaiHadir), DaftarSlot), NilaiHadir < 75.

% Rule 3: Kesimpulannya "Aman"
% JIKA IPK aman (>= 2.0) DAN kehadiran aman (>= 75)
kesimpulan_do(Nama, 'Aman') :-
    frame(Nama, DaftarSlot),
    member(ipk(NilaiIPK), DaftarSlot), NilaiIPK >= 2.0,
    member(kehadiran(NilaiHadir), DaftarSlot), NilaiHadir >= 75.