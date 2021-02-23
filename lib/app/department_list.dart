 class Department{
  String name;
  int id;
  String url;
  int loc;

  Department(this.name, this.id, this.url, this.loc);
}
List<List<Department>> deparment1 = [
  [Department('Medeniyet Üniversitesi', 0, 'https://www.medeniyet.edu.tr', 2)],
  [Department('Diş Hekimliği Fakültesi', 1, 'https://dishekimligi.medeniyet.edu.tr', 1)],
  [Department('Edebiyat Fakültesi', 2, 'https://edebiyat.medeniyet.edu.tr', 1)],
  [Department('Eğitim Bilimleri Fakültesi', 3, 'https://egitimbilimleri.medeniyet.edu.tr', 1)],
  [Department('Hukuk Fakültesi', 4, 'https://hukuk.medeniyet.edu.tr', 1)],
  [Department('Mühendislik ve Doğa Bilimleri Fakültesi', 5, 'https://muhendislikdogabilimleri.medeniyet.edu.tr', 1),],
  [Department('Sağlık Bilimleri Fakültesi', 5, 'https://saglikbilimleri.medeniyet.edu.tr', 1),],
  [Department('Sanat, Tasarım ve Mimarlık Fakültesi', 5, 'https://stm.medeniyet.edu.tr', 1),],
  [Department('Siyasal Bilgiler Fakültesi', 5, 'https://siyasalbilgiler.medeniyet.edu.tr', 1),],
  [Department('Tıp Fakültesi', 5, 'https://tip.medeniyet.edu.tr', 1),],
  [Department('Turizm Fakültesi', 5, 'https://turizm.medeniyet.edu.tr', 1),],

 ];

List<List<String>> department = [
   ['Diş Hekimliği Fakültesi'],
   ['Edebiyat Fakültesi'],
   ['Eğitim Bilimleri Fakültesi'],
   ['Hukuk Fakültesi'],
   ['Mühendislik ve Doğa Bilimleri Fakültesi',
    ' Bilgisayar Mühendisliği',
     'Biyomedikal Mühendisliği',
     'Biyomühendislik',
     'Elektrik-Elektronik Mühendisliği',
     'Endüstri Mühendisliği',
     'Fizik Mühendisliği',
     'İnşaat Mühendisliği',
     'İstatistik',
     'Kimya',
     'Makine Mühendisliği',
     'Matematik',
     'Moleküler Biyoloji ve Genetik',
     'Uzay Mühendisliği',
     'Mühendislik Temel Bilimleri',
     'Uçak Mühendisliği',
   ],
   ['Sağlık Bilimleri Fakültesi'],
   ['Sanat, Tasarım ve Mimarlık Fakültesi'],
   ['Siyasal Bilgiler Fakültesi'],
   ['Tıp Fakültesi'],
   ['Turizm Fakültesi'],
];