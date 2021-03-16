from django import forms
from .models import Skoki, KalendarzPs, Zawodnicy, Sedziowie, Oceny


class FormSkoki(forms.ModelForm):
    class Meta:

        # id_konkursu = forms.ModelChoiceField(queryset=KalendarzPs.objects.all())
        # id_zawodnika = forms.ModelChoiceField(queryset=Zawodnicy.objects.all())
        # typ = forms.ChoiceField(choices = (1, 2), default=1)
        # odleglosc = forms.FloatField()
    
        model = Skoki 
        
        fields = [
            'id_konkursu',
            'id_zawodnika',
            'typ',
            'odleglosc'
        ]

        TYP_CHOICES=[('First', '1'), ('Second','2')]

        odleglosc = forms.IntegerField(widget=forms.NumberInput(attrs={'class': 'form-control'}))
        typ = forms.ChoiceField(choices=TYP_CHOICES, widget=forms.Select(attrs={'class': 'form-control'}))
        id_konkursu = forms.ModelChoiceField(queryset=KalendarzPs.objects.all(), widget=forms.Select(attrs={'class': 'form-control'}))
        id_zawodnika = forms.ModelChoiceField(queryset=Zawodnicy.objects.all(), widget=forms.Select(attrs={'class': 'form-control'}))

        widgets = {
            'id_konkursu': forms.Select(
                attrs={'class': 'form-control'},
                choices=KalendarzPs.objects.all()
            ),
            'id_zawodnika' : forms.Select(
                attrs={'class': 'form-control'},
                choices=Zawodnicy.objects.all()
            ),
            'odleglosc': forms.NumberInput(
                attrs={'class': 'form-control'}
            ),
            'typ': forms.Select(
                attrs={'class': 'form-control'},
                choices=TYP_CHOICES
            )
        }    


class FormSkokiDisabledFields(forms.ModelForm):
    class Meta:

        model = Skoki 
        fields = [
            'id_konkursu',
            'id_zawodnika',
            'typ',
            'odleglosc'
        ]

        TYP_CHOICES=[('First', '1'), ('Second','2')]

        widgets = {
            'id_konkursu': forms.Select(
                attrs={'class': 'form-control', 'disabled':'true'},
                choices=KalendarzPs.objects.all()
            ),
            'id_zawodnika' : forms.Select(
                attrs={'class': 'form-control', 'disabled':'true'},
                choices=Zawodnicy.objects.all()
            ),
            'odleglosc': forms.NumberInput(
                attrs={'class': 'form-control'}
            ),
            'typ': forms.Select(
                attrs={'class': 'form-control', 'disabled':'true'},
                choices=TYP_CHOICES
            )
        }


class FormOceny(forms.ModelForm):
    class Meta:

        model = Oceny

        fields = [
            'id_oceny',
            'ocena',
            'id_zawodnika',
            'id_sedziego',
            'id_skoku'
        ]
        
        OCENA_CHOICES=[('15.5','15.5'), ('16.0','16.0'), ('16.5','16.5'), ('17.0','17.0'), ('17.5','17.5'), ('18.0','18.0'), ('18.5','18.5'), ('19.0','19.0'), ('19.5','19.5'), ('20.0','20.0')]
        
        ocena = forms.ChoiceField(choices=OCENA_CHOICES, widget=forms.Select(attrs={'class': 'form-control'}))
        id_sedziego = forms.ModelChoiceField(queryset=Sedziowie.objects.all(), widget=forms.Select(attrs={'class': 'form-control'}))
        id_zawodnika = forms.ModelChoiceField(queryset=Zawodnicy.objects.all(), widget=forms.Select(attrs={'class': 'form-control'}))
        id_skoku = forms.ModelChoiceField(queryset=Skoki.objects.all(), widget=forms.Select(attrs={'class': 'form-control'}))

        
        widgets = {
            'ocena': forms.Select(
                attrs={'class': 'form-control'},
                choices=OCENA_CHOICES
            ),
            'id_sedziego': forms.Select(
                attrs={'class': 'form-control'},
                choices=Sedziowie.objects.all()
            ),
            'id_zawodnika' : forms.Select(
                attrs={'class': 'form-control'},
                choices=Zawodnicy.objects.all()
            ),
            'id_skoku' : forms.Select(
                attrs={'class': 'form-control'},
                choices=Skoki.objects.all()
            )
        }  
        
    

    

class FormZawodnicy(forms.ModelForm):
    class Meta:
        model = Zawodnicy
        fields = [
            'imie',
            'nazwisko',
            'narodowosc',
            'data_urodzenia'
        ]
        widgets = {
            'imie': forms.TextInput(
                attrs = {
                    'class': 'form-control'
                }
            ),
            'nazwisko': forms.TextInput(
                attrs = {
                    'class': 'form-control'
                }
            ),
            'narodowosc': forms.TextInput(
                attrs = {
                    'class': 'form-control'
                }
            ),
            'data_urodzenia': forms.DateInput(
                attrs = {
                    'class': 'form-control',
                    'type' : 'date'
                }
            )
        }


# class FormSkoki(forms.ModelForm):
#     class Meta:

#         fields = [
#             'id_skoku',
#             'id_konkursu',
#             'id_zawodnika',
#             'typ',
#             'odleglosc'        
#         ]

#         TYP_CHOICES=[('First', '1'), ('Second','2')]

#         widgets = {
#             'id_konkursu': forms.Select(
#                 attrs={'class': 'form-control'},
#                 choices=KalendarzPs.objects.all()
#             ),
#             'id_zawodnika' : forms.Select(
#                 attrs={'class': 'form-control'},
#                 choices=Zawodnicy.objects.all()
#             ),
#             'odleglosc': forms.NumberInput(
#                 attrs={'class': 'form-control'}
#             ),
#             'typ': forms.Select(
#                 attrs={'class': 'form-control'},
#                 choices=TYP_CHOICES
#             )
#         }
