import random

# --- 1. Definer kortenes egenskaber ---

FARVER = ["Hjerter", "Ruder", "Klør", "Spar"]
VÆRDIER = [
    "Es", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Knægt", "Dronning", "Konge"
]

class Kort:
    """En simpel klasse til at repræsentere et spillekort."""
    def __init__(self, farve, værdi):
        self.farve = farve
        self.værdi = værdi
    
    def __str__(self):
        # Dette gør, at når vi printer kortet, får vi et pænt navn
        return f"{self.værdi} af {self.farve}"

# --- 2. Definer bunken ---

class Bunke:
    """En klasse til at repræsentere kortbunken."""
    def __init__(self):
        self.kort = []
        self.fyld_bunken()

    def fyld_bunken(self):
        """Opretter et standard 52-korts spil."""
        self.kort = [Kort(farve, værdi) for farve in FARVER for værdi in VÆRDIER]
        print("Kortbunken er oprettet med 52 kort.")

    def bland(self):
        """Blander kortene tilfældigt."""
        random.shuffle(self.kort)
        print("\nKortene er blandet!")

    def træk_kort(self):
        """Fjerner og returnerer det øverste kort."""
        if self.kort:
            return self.kort.pop(0) # .pop(0) tager det første kort i listen
        else:
            return "Bunken er tom!"

# --- 3. Hovedspil-logik ---

def start_spillet():
    spil_bunke = Bunke()
    spil_bunke.bland()
    
    # Simpel kabale-simulering: Træk 5 kort
    print("\n--- Simpel Kabale Demo: Trækker de første 5 kort ---")

    antal_trukne = 0
    while antal_trukne < 5 and spil_bunke.kort:
        input("Tryk på ENTER for at trække et kort...")
        trukket_kort = spil_bunke.træk_kort()
        
        if isinstance(trukket_kort, Kort):
            print(f"Du trak: **{trukket_kort}**")
            antal_trukne += 1
            print(f"Kort tilbage i bunken: {len(spil_bunke.kort)}")
        else:
            print(trukket_kort)
            break

    print("\n--- Spillet slut (Demostrationen er slut) ---")

# Kør spillet, når scriptet startes
if __name__ == "__main__":
    start_spillet().
