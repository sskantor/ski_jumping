# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class KalendarzPs(models.Model):
    id_konkursu = models.AutoField(primary_key=True)
    id_skoczni = models.ForeignKey('Skocznie', on_delete=models.CASCADE, db_column='id_skoczni')
    typ_konkursu = models.CharField(max_length=45)
    data = models.DateField()

    def __str__(self):
        return str(self.data)
    class Meta:
        db_table = 'kalendarz_ps'
        verbose_name = "Kalendarz PS"
        verbose_name_plural= "Kalendarz PS"

class Oceny(models.Model):
    id_oceny = models.AutoField(primary_key=True)
    ocena = models.FloatField()
    id_zawodnika = models.ForeignKey('Zawodnicy', on_delete=models.CASCADE, db_column='id_zawodnika')
    id_sedziego = models.ForeignKey('Sedziowie', on_delete=models.CASCADE, db_column='id_sedziego')
    id_skoku = models.ForeignKey('Skoki', on_delete=models.CASCADE, db_column='id_skoku')

    class Meta:
        
        db_table = 'oceny'


class Sedziowie(models.Model):
    id_sedziego = models.AutoField(primary_key=True)
    imie = models.CharField(max_length=45)
    nazwisko = models.CharField(max_length=45)
    narodowosc = models.CharField(max_length=45)

    def __str__(self):
        return self.imie + " " + self.nazwisko

    class Meta:
        
        db_table = 'sedziowie'
        verbose_name = "Sedziowie"
        verbose_name_plural= "Sedziowie"

class Skocznie(models.Model):
    id_skoczni = models.CharField(primary_key=True, max_length=255)
    kraj = models.CharField(max_length=45)
    miasto = models.CharField(max_length=45)
    nazwa = models.CharField(unique=True, max_length=45)
    punkt_k = models.FloatField()
    punkt_hs = models.FloatField()
    
    def __str__(self):
        return self.id_skoczni

    class Meta:
        db_table = 'skocznie'
        verbose_name = "Skocznia"
        verbose_name_plural = "Skocznie"

class Skoki(models.Model):
    id_skoku = models.AutoField(primary_key=True)
    id_konkursu = models.ForeignKey(KalendarzPs, on_delete=models.CASCADE, db_column='id_konkursu')
    id_zawodnika = models.ForeignKey('Zawodnicy', on_delete=models.CASCADE, db_column='id_zawodnika')
    odleglosc = models.FloatField()
    typ = models.CharField(max_length=45)

    class Meta:

        db_table = 'skoki'


class Wyniki(models.Model):
    id_wyniku = models.AutoField(primary_key=True)
    id_konkursu = models.ForeignKey(KalendarzPs, on_delete=models.CASCADE, db_column='id_konkursu')
    id_zawodnika = models.ForeignKey('Zawodnicy', on_delete=models.CASCADE, db_column='id_zawodnika')
    number_1_punkty = models.FloatField(db_column='1_punkty', default=0)  # Field renamed because it wasn't a valid Python identifier.
    number_2_punkty = models.FloatField(db_column='2_punkty', default=0)  # Field renamed because it wasn't a valid Python identifier.
    wynik = models.FloatField(default=0)

    class Meta:

        db_table = 'wyniki'


class Zawodnicy(models.Model):
    id_zawodnika = models.AutoField(primary_key=True)
    imie = models.CharField(max_length=45)
    nazwisko = models.CharField(max_length=45)
    narodowosc = models.CharField(max_length=45)
    data_urodzenia = models.DateField()
    ilosc_punktow = models.FloatField(default=0)

    def __str__(self):
        return self.nazwisko

    class Meta:

        db_table = 'zawodnicy'
        verbose_name = "Zawodnicy"
        verbose_name_plural= "Zawodnicy"
