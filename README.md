# Podsumowanie analiz biznesowych

## Customer Analytics

### Charakterystyki demograficzne klientów
- Znaczna większość klientów znajduje się w dużych aglomeracjach stanów SP, RJ, MG.
- Dwa największe miasta to Sao Paulo oraz Rio De Janeiro.
- Małe stany są mniejszością; decyzja biznesowa może dotyczyć zwiększenia ekspozycji na mniejsze stany lub umocnienia pozycji w trzech największych.

### Klienci generujący największą wartość (CLV)
- W top 100 klientów pod względem CLV, 51 pochodzi z top 3 stanów: SP, RJ, MG.
- Klienci ci generują około 52% wartości CLV w grupie 100 klientów.
- 49 pozostałych odpowiada za 48% wartości CLV, bez wyraźnej przewagi jednej grupy.
- W top 100 klientów o najdłuższym czasie życia w sprzedaży, 75% to klienci z top 3 stanów.

### Segmentacja klientów (RFM Analysis)
- Do wykonania wizualizacja segmentów klientów na bazie analizy RFM.

## Sales Performance

### Trendy miesięczne i kwartalne
- Najwyższa sprzedaż występuje w maju, najniższa we wrześniu.
- Najlepszy kwartał sprzedaży to Q2, najsłabszy Q4.
- Obserwowany jest spadek wartości zakupów od września do października, wzrost w listopadzie przed świętami oraz spadek w grudniu.

### Top produkty i kategorie
- Najpopularniejsze kategorie to między innymi:
  - health_beauty
  - watches_gifts
  - bed_bath_table
  - sports_leisure
  - computers_accessories
  - furniture_decor
  - housewares
  - cool_stuff
  - auto
  - garden_tools

### Sezonowość zamówień
- Największa sprzedaż od poniedziałku do środy, najniższa w niedzielę.
- Najwięcej zakupów między 11:00 a 16:00.
- Najmniej sprzedaży w godzinach od północy do 8:00.
- Zaleca się zwiększenie zaangażowania klientów przed południem.

## Operational Efficiency

### Czas dostawy według regionów
- W stanach SP i MG średni czas dostawy 6-9 dni, natomiast w RJ aż 12 dni.
- W ponad połowie stanów czas dostawy wynosi 14 dni i więcej, sięgając nawet 26 dni.

### Analiza opóźnień dostaw
- 89% przesyłek jest dostarczanych szybciej niż przewidywano, 7% jest opóźnionych.
- 3% przesyłek jest w trakcie dostawy.
- Rekomendacja: usprawnić system przewidywania czasu dostawy oraz synchronizację statusów między firmą kurierską a firmą.

## Korelacja kosztu wysyłki z wartością zamówienia

- Współczynnik korelacji Pearsona wynosi około 0.414, co oznacza słabą dodatnią korelację.
- Niektórzy sprzedawcy wykazują wysoką dodatnią korelację, co może wskazywać na potrzebę optymalizacji cennika wysyłek.

## Customer Satisfaction

### Wpływ czasu dostawy na oceny klientów
- Dostawy szybsze niż przewidywano: 88658 ocen, średnia ocena 4.29/5.
- Dostawy na czas: 1291 ocen, średnia ocena 4.03/5.
- Dostawy opóźnione: 6410 ocen, średnia ocena 2.27/5.
- Przesyłki w dostawie: 2865 ocen, średnia 1.76/5.
- Rekomendacja: dalsza analiza przyczyn niskich ocen, szczególnie dla przesyłek w dostawie, oraz analiza tekstów opinii (NLP).

### Analiza recenzji według kategorii
- Najwięcej opinii (11137) dotyczy kategorii bed/bath tables, średnia ocena 3.9/5.
- Najniższa ocena 2.5/5 dotyczy kategorii security and services (2 opinie).
- Produkty bez kategorii mają 1622 opinie ze średnią oceną 3.83/5.
- Warto uzupełnić brakujące kategorie produktów.
- Rekomendacja: stworzyć wizualizację wyników.

### Czynniki wpływające na satysfakcję
- Wykryto słabą, lecz pozytywną korelację między opóźnieniem a oceną.
- Inne zmienne nie wykazały istotnego wpływu na ocenę.

## Revenue Optimization

### Analiza metod płatności
- Najpopularniejszą metodą jest karta kredytowa z łączną wartością ~12,54 mln peso.
- Druga metoda to boleto (~3 mln peso) – popularny w Brazylii rodzaj transakcji bankowej.
- Voucher i karta debetowa mają odpowiednio ~379 tys. i 217 tys. peso wartości.
- Raty: najczęstsza liczba rat to 1-4; powyżej 10 rat transakcje są rzadkie.

## Identyfikacja najdroższych produktów
| Produkt ID                            | Cena   | Kategoria           |
|-------------------------------------|--------|---------------------|
| 489ae2aa008f021502940f251d4cce7f    | 6735   | housewares          |
| 69c590f7ffc7bf8db97190b6cb6ed62e    | 6729   | computers           |
| 1bdf5e6731585cf01aa8169c7028d6ad    | 6499   | art                 |
| a6492cc69376c469ab6f61d8f44de961    | 4799   | small_appliances    |
| c3ed642d592594bb648ff4a04cee2747    | 4690   | small_appliances    |
| 259037a6a41845e455183f89c5035f18    | 4590   | computers           |
| a1beef8f3992dbd4cd8726796aa69c53    | 4399.87| musical_instruments |
| 6cdf8fc1d741c76586d8b15e9eef30      | 4099.99| consoles_games      |
| dd113cb02b2af9c8e5787e8f1f0722f6    | 4059   | sports_leisure      |
| 6902c1962dd19d540807d0ab8fade5c6    | 3999.9 | watches_gifts       |

---

*Dokument ten stanowi podsumowanie dotychczas przeprowadzonych analiz i może służyć jako baza do dalszych działań i raportów wizualnych.*
