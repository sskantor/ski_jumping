from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.db import connection, transaction
from .models import KalendarzPs, Skocznie, Sedziowie, Zawodnicy, Skoki, Oceny, Wyniki
from .forms import FormSkoki, FormOceny, FormZawodnicy, FormSkokiDisabledFields
from django.db.models import Avg, F, Max, Min, Window

from .custom_functions import checkInput

konkurs_for_positions = KalendarzPs.objects.order_by('id_konkursu').first()
id_konkursu_for_positions = konkurs_for_positions.id_konkursu

# Create your views here

def home(request):
    return render(request, "home.html", {})


def konkursy(request):
    results = KalendarzPs.objects.select_related('id_skoczni').all()
    return render(request, "konkursy.html", {"KalendarzPs":results})


def skocznie(request):
    results = Skocznie.objects.all()
    return render(request, "skocznie.html", {"Skocznie":results})


def update(request):

    formSkoki = FormSkoki()    
    formOceny1 = FormOceny()
    formOceny2 = FormOceny()
    formOceny3 = FormOceny()
    formOceny4 = FormOceny()
    formOceny5 = FormOceny()

    if request.method == 'POST':
        
        print(request.POST)

        #if formSkoki.is_valid():
        #if formSkoki.is_valid() and formOceny1.is_valid() and formOceny2.is_valid and formOceny3.is_valid() and formOceny4.is_valid() and formOceny5.is_valid():

        cursor = connection.cursor()

        query_list = (
            request.POST.get('id_konkursu'),
            request.POST.get('id_zawodnika'),
            request.POST.get('odleglosc'),
            request.POST.get('typ')
        )
        
        print(checkInput(query_list))

        if (checkInput(query_list) == 1):
            print('Banned characters!')
            return HttpResponseRedirect('/recent')

        query = ''' 
            INSERT INTO skoki (id_konkursu, id_zawodnika, odleglosc, typ)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list)  

        cursor.execute(query)
        cursor.execute('''SELECT MAX(id_skoku) FROM skoki''')
        max_id_skoku_tmp = cursor.fetchall()
        max_id_skoku = max_id_skoku_tmp[0][0]

        query_list1 = (
            request.POST.getlist('ocena')[0],
            request.POST.getlist('id_sedziego')[0],
            request.POST.get('id_zawodnika'),
            max_id_skoku
        )
        query_list2 = (
            request.POST.getlist('ocena')[1],
            request.POST.getlist('id_sedziego')[1],
            request.POST.get('id_zawodnika'),
            max_id_skoku
        )
        query_list3 = (
            request.POST.getlist('ocena')[2],
            request.POST.getlist('id_sedziego')[2],
            request.POST.get('id_zawodnika'),
            max_id_skoku
        )
        query_list4 = (
            request.POST.getlist('ocena')[3],
            request.POST.getlist('id_sedziego')[3],
            request.POST.get('id_zawodnika'),
            max_id_skoku
        )
        query_list5 = (
            request.POST.getlist('ocena')[4],
            request.POST.getlist('id_sedziego')[4],
            request.POST.get('id_zawodnika'),
            max_id_skoku
        )

        
        query1 = ''' 
            INSERT INTO oceny (ocena, id_sedziego, id_zawodnika, id_skoku)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list1)
        query2 = ''' 
            INSERT INTO oceny (ocena, id_sedziego, id_zawodnika, id_skoku)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list2)
        query3 = ''' 
            INSERT INTO oceny (ocena, id_sedziego, id_zawodnika, id_skoku)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list3)
        query4 = ''' 
            INSERT INTO oceny (ocena, id_sedziego, id_zawodnika, id_skoku)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list4)
        query5 = ''' 
            INSERT INTO oceny (ocena, id_sedziego, id_zawodnika, id_skoku)
            VALUES ('{0}', '{1}', '{2}', '{3}')
        '''.format(*query_list5)


        cursor.execute(query1)
        cursor.execute(query2)
        cursor.execute(query3)
        cursor.execute(query4)
        cursor.execute(query5)        
        

        #add to table wyniki
        #check if row with id_zawodnika and id_konkursu exist
        id_konkursu = request.POST.get('id_konkursu')
        id_zawodnika = request.POST.get('id_zawodnika')
        query_list_h = (
            id_konkursu,
            id_zawodnika
        )
        query_h = '''
            SELECT id_wyniku, 1_punkty, 2_punkty, wynik FROM wyniki WHERE id_konkursu='{0}' and id_zawodnika='{1}'
        '''.format(*query_list_h)
        cursor.execute(query_h)
        id_wyniku_all = cursor.fetchall()
        
        punkty = float(request.POST.getlist('ocena')[0]) + float(request.POST.getlist('ocena')[1]) + float(request.POST.getlist('ocena')[2]) + float(request.POST.getlist('ocena')[3]) + float(request.POST.getlist('ocena')[4])
        punkty = (punkty/5) * 3
        punkty += float(request.POST.get('odleglosc'))

        if len(id_wyniku_all) == 0:
            #insert

            #seria 1
            if request.POST.get('typ') == "First":
                query_list6 = (
                    id_konkursu,
                    id_zawodnika,
                    punkty
                )
                query6=''' 
                    INSERT INTO wyniki (id_konkursu, id_zawodnika, 1_punkty, wynik)
                    VALUES ('{0}', '{1}', '{2}', '{2}')
                '''.format(*query_list6)
                cursor.execute(query6)

            #seria 2
            if request.POST.get('typ') == "Second":
                query_list6 = (
                    id_konkursu,
                    id_zawodnika,
                    punkty
                )
                query6=''' 
                    INSERT INTO wyniki (id_konkursu, id_zawodnika, 2_punkty, wynik)
                    VALUES ('{0}', '{1}', '{2}', '{2}')
                '''.format(*query_list6)
                cursor.execute(query6)

        else:
            id_wyniku = id_wyniku_all[0][0]
            wynik1 = id_wyniku_all[0][1]
            wynik2 = id_wyniku_all[0][2]
            
            wynik_all_1 = wynik2 + punkty
            wynik_all_2 = wynik1 + punkty

            #update

            #seria 1
            if request.POST.get('typ') == "First":
                query_list6 = (
                    id_wyniku,
                    punkty,
                    wynik_all_1
                )
                query6=''' 
                    UPDATE wyniki SET 1_punkty={1}, wynik={2} WHERE id_wyniku={0}
                '''.format(*query_list6)
                cursor.execute(query6)

            #seria 2
            if request.POST.get('typ') == "Second":
                query_list6 = (
                    id_wyniku,
                    punkty,
                    wynik_all_2
                )
                query6=''' 
                    UPDATE wyniki SET 2_punkty={1}, wynik={2} WHERE id_wyniku={0}
                '''.format(*query_list6)
                cursor.execute(query6)
            
        transaction.commit()

        return HttpResponseRedirect('/recent')


    context =  {
        "formSkoki": formSkoki,
        "formOceny1": formOceny1,
        "formOceny2": formOceny2,
        "formOceny3": formOceny3,
        "formOceny4": formOceny4,
        "formOceny5": formOceny5
    }
    
    return render(request, "update.html", context)


def recent(request):
    cursor = connection.cursor()
    cursor.execute('''
        SELECT s.id_skoku, z.imie, z.nazwisko, k.data, o.kraj, o.miasto, s.typ, s.odleglosc
        FROM zawodnicy z, skoki s, kalendarz_ps k, skocznie o
        WHERE s.id_zawodnika = z.id_zawodnika and s.id_konkursu = k.id_konkursu and k.id_skoczni=o.id_skoczni
        ORDER BY s.id_skoku DESC
        ''')
    
    skoki = cursor.fetchall()
    context = {'skoki':skoki}

    return render(request, "recent.html", context)


def browse(request):
    return render(request, "browse.html", {})

def general(request):
    return render(request, "browse/general.html", {})

def notes(request):
    return render(request, "browse/notes.html", {})

def zawodnicy(request):
    zawodnicy = Zawodnicy.objects.all()
    return render(request, "zawodnicy.html", {"Zawodnicy":zawodnicy})


def zawodnicy_add(request):
    if request.method == 'POST':
        form = FormZawodnicy(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/zawodnicy')

    form = FormZawodnicy()

    context = {
        'form' : form
    }

    return render(request, "zawodnicy_add.html", context)


def edit_skok(request, id):
    skok = Skoki.objects.get(id_skoku=id)
    oceny = Oceny.objects.select_related('id_skoku').filter(id_skoku=id)

    formSkoki = FormSkokiDisabledFields(instance=skok)
    formOceny1 = FormOceny(instance=oceny[0])
    formOceny2 = FormOceny(instance=oceny[1])
    formOceny3 = FormOceny(instance=oceny[2])
    formOceny4 = FormOceny(instance=oceny[3])
    formOceny5 = FormOceny(instance=oceny[4])
    
    if request.method == 'POST':
 
        cursor = connection.cursor()

        query_list_to_check = (
            request.POST.get('odleglosc')
        )
        
        if (checkInput(query_list_to_check) == 1):
            print('Banned characters!')
            return HttpResponseRedirect('/recent')

        query_list = (
            skok.id_skoku,
            request.POST.get('odleglosc')
        )
        
        query_list1 = (
            oceny[0].id_oceny,
            request.POST.getlist('ocena')[0],
            request.POST.getlist('id_sedziego')[0]
        )
        query_list2 = (
            oceny[1].id_oceny,
            request.POST.getlist('ocena')[1],
            request.POST.getlist('id_sedziego')[1]
        )
        query_list3 = (
            oceny[2].id_oceny,
            request.POST.getlist('ocena')[2],
            request.POST.getlist('id_sedziego')[2]
        )
        query_list4 = (
            oceny[3].id_oceny,
            request.POST.getlist('ocena')[3],
            request.POST.getlist('id_sedziego')[3]
        )
        query_list5 = (
            oceny[4].id_oceny,
            request.POST.getlist('ocena')[4],
            request.POST.getlist('id_sedziego')[4]
        )

        query = ''' 
            UPDATE skoki SET odleglosc={1} WHERE id_skoku={0}'''.format(*query_list)        
        query1 = ''' 
            UPDATE oceny SET ocena={1}, id_sedziego={2} WHERE id_oceny={0}'''.format(*query_list1)
        query2 = ''' 
            UPDATE oceny SET ocena={1}, id_sedziego={2} WHERE id_oceny={0}'''.format(*query_list2)
        query3 = ''' 
            UPDATE oceny SET ocena={1}, id_sedziego={2} WHERE id_oceny={0}'''.format(*query_list3)
        query4 = ''' 
            UPDATE oceny SET ocena={1}, id_sedziego={2} WHERE id_oceny={0}'''.format(*query_list4)
        query5 = ''' 
            UPDATE oceny SET ocena={1}, id_sedziego={2} WHERE id_oceny={0}'''.format(*query_list5)

        cursor.execute(query)        
        cursor.execute(query1)
        cursor.execute(query2)
        cursor.execute(query3)
        cursor.execute(query4)
        cursor.execute(query5)

        #update table wyniki

        #get id_wyniku
        id_konkursu = skok.id_konkursu.id_konkursu
        id_zawodnika = skok.id_zawodnika.id_zawodnika
        query_list_h = (
            id_konkursu,
            id_zawodnika
        )
        query_h = '''
            SELECT id_wyniku, 1_punkty, 2_punkty, wynik FROM wyniki WHERE id_konkursu='{0}' and id_zawodnika='{1}'
        '''.format(*query_list_h)
        cursor.execute(query_h)

        id_wyniku_all = cursor.fetchall()
        id_wyniku = id_wyniku_all[0][0]
        wynik1 = id_wyniku_all[0][1]
        wynik2 = id_wyniku_all[0][2]

        punkty = float(request.POST.getlist('ocena')[0]) + float(request.POST.getlist('ocena')[1]) + float(request.POST.getlist('ocena')[2]) + float(request.POST.getlist('ocena')[3]) + float(request.POST.getlist('ocena')[4])
        punkty = (punkty/5) * 3
        punkty += float(request.POST.get('odleglosc'))

        wynik_all_1 = wynik2 + punkty
        wynik_all_2 = wynik1 + punkty

        #update

        #seria 1
        if skok.typ == "First":
            query_list6 = (
                id_wyniku,
                punkty,
                wynik_all_1
            )
            query6=''' 
                UPDATE wyniki SET 1_punkty={1}, wynik={2} WHERE id_wyniku={0}
            '''.format(*query_list6)
            cursor.execute(query6)

        #seria 2
        if skok.typ == "Second":
            query_list6 = (
                id_wyniku,
                punkty,
                wynik_all_2
            )
            query6=''' 
                UPDATE wyniki SET 2_punkty={1}, wynik={2} WHERE id_wyniku={0}
            '''.format(*query_list6)
            cursor.execute(query6)


        transaction.commit()
        return HttpResponseRedirect('/recent')

    context = {
        'skok' : skok,
        "formSkoki": formSkoki,
        "formOceny1": formOceny1,
        "formOceny2": formOceny2,
        "formOceny3": formOceny3,
        "formOceny4": formOceny4,
        "formOceny5": formOceny5
    }  
    return render(request, "edit.html", context)


def delete_skok(request, id):
    skok = Skoki.objects.get(id_skoku=id)

    #update table wyniki
    #cursor = connection.cursor()
    #get id_wyniku
    id_konkursu = skok.id_konkursu.id_konkursu
    id_zawodnika = skok.id_zawodnika.id_zawodnika
    wynik = Wyniki.objects.get(id_konkursu=id_konkursu, id_zawodnika=id_zawodnika)

    #update

    #seria 1
    if skok.typ == "First":
        if wynik.number_2_punkty == 0:
            wynik.delete()
        else:
            wynik.number_1_punkty = 0
            wynik.wynik = wynik.number_2_punkty
            wynik.save()

    #seria 2
    if skok.typ == "Second":
        if wynik.number_1_punkty == 0:
            wynik.delete()
        else:
            wynik.number_2_punkty = 0
            wynik.wynik = wynik.number_1_punkty
            wynik.save()

    skok.delete()
    return HttpResponseRedirect('/recent')
    #return render(request, "delete.html", {})


def delete_zawodnik(request, id):
    zawodnik = Zawodnicy.objects.get(id_zawodnika=id)
    zawodnik.delete()
    return HttpResponseRedirect('/zawodnicy')
    #return render(request, "delete.html", {})


def longest(request):

    queryset = Skoki.objects.values('id_konkursu').annotate(odleglosc_max=Max('odleglosc'))
    skoki = []
    for entry in queryset:
        skok = Skoki.objects.select_related('id_zawodnika').get(id_konkursu=entry['id_konkursu'], odleglosc=entry['odleglosc_max'])
        skoki.append(skok)

    cursor = connection.cursor()
    cursor.execute('''
        SELECT k.data, o.nazwa, s.odleglosc
        FROM skoki s, kalendarz_ps k, skocznie o
      ''')
    
    #GROUP BY k.is_konkursu???
    #cursor.execute('''
     #   SELECT max(s.odleglosc)
      #  FROM skoki s, kalendarz_ps k
       # GROUP BY k.id_konkursu
        #''')
    dane = cursor.fetchall()

    print('Wyciagniete dane: ', dane)
    #no ten zapytanie jest ewidentnie nie tak jak ma być xD
    context = {'dane':dane, 'skoki':skoki}

    return render(request, "browse/longest.html", context)

def longest_chart(request):
    labels = []
    data = []

    queryset = Skoki.objects.values('id_konkursu').annotate(odleglosc_max=Max('odleglosc'))
    for entry in queryset:
        
        labels.append(entry['id_konkursu'])
        data.append(entry['odleglosc_max'])
    return JsonResponse(data={
        'labels': labels,
        'data': data,
    })

def positions(request):

    global id_konkursu_for_positions
    
    if request.method == 'POST':
        id_konkursu_for_positions = request.POST.get('id_konkursu')

    konkurs = KalendarzPs.objects.get(id_konkursu=id_konkursu_for_positions)

    formSkoki = FormSkoki(instance=konkurs)
    context = { 
        'formSkoki':formSkoki
    }
    return render(request, "browse/positions.html", context)

def positions_chart(request):

    cursor = connection.cursor()
    cursor.execute('''
    SELECT `imie`, `nazwisko`, `ilosc_punktow`, 
    ROW_NUMBER() OVER (ORDER BY `ilosc_punktow` DESC) row_num 
    FROM zawodnicy
    ''')
    rows = cursor.fetchall()
    #print('Dane:', rows)
    data = []
    labels = []

    for row in rows:
        labels.append(row[1])
        data.append(row[2])
    return JsonResponse(data={
        'labels': labels,
        'data': data,
    })

def positions_per_comp_chart(request):
    
    global id_konkursu_for_positions

    cursor = connection.cursor()
    id_konkursu = id_konkursu_for_positions
    query_list = (id_konkursu)
    query = '''
        SELECT id_wyniku, id_konkursu, wynik, wyniki.id_zawodnika, nazwisko,
        ROW_NUMBER() OVER (PARTITION BY id_konkursu ORDER BY wynik DESC) row_num 
        FROM wyniki INNER JOIN zawodnicy WHERE zawodnicy.id_zawodnika=wyniki.id_zawodnika AND wyniki.id_konkursu={0}
    '''.format(query_list)
    cursor.execute(query)
    rows = cursor.fetchall()
    #print('Dane:', rows)
    data = []
    labels = []

    for row in rows:
        labels.append(row[4])
        data.append(row[2])
    return JsonResponse(data={
        'labels': labels,
        'data': data,
    })

def notes_avg_chart(request):
    cursor = connection.cursor()
    cursor.execute('''
    SELECT avg(ocena), o.id_zawodnika, z.nazwisko 
    FROM oceny o, zawodnicy z 
    WHERE z.id_zawodnika=o.id_zawodnika
    GROUP BY o.id_zawodnika
    ORDER BY avg(ocena) DESC 
    ''')
    rows = cursor.fetchall()
    #print('Dane:', rows)
    data = []
    labels = []

    for row in rows:
        labels.append(row[2])
        data.append(row[0])
    return JsonResponse(data={
        'labels': labels,
        'data': data,
    })   