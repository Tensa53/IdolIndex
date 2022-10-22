package org.example;

import java.io.IOException;
import java.sql.Time;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.regex.PatternSyntaxException;

public class Main {

    private static int menu() {
        Scanner in = new Scanner(System.in);
        int n = 0;

        System.out.println("******BENVENUTO AL PROGRAMMA GESTIONALE DI MUSICSHOW******");
        System.out.println("******Seleziona una delle voci per interagire con il programma******");
        System.out.println("0. Esci dal programma");
        System.out.println("1. Elenca i MusicShow");
        System.out.println("2. Inserisci un nuovo MusicShow");
        System.out.println("3. Modifica un MusicShow");
        System.out.println("4. Elimina un MusicShow");
        System.out.println("5. Esegui la query1 tra quelle del progetto");

        try {
            n = in.nextInt();
        } catch (InputMismatchException e) {
            System.out.println("Inserire un valore numerico intero !!! Il programma terminerà");
        }

        return n;
    }

    private static Time getFormattedTime(String ora) throws NumberFormatException, PatternSyntaxException {
        String[] orario = new String[3];
        orario = ora.split(":");

        int tot;
        int ore, minuti, secondi;

        ore = Integer.parseInt(orario[0]);
        minuti = Integer.parseInt(orario[1]);
        secondi = Integer.parseInt(orario[2]);

        tot = (ore - 1) * 3600000 + minuti * 60000 + secondi * 1000;

        return new Time(tot);
    }

    private static void inserimento() {
        Scanner in = new Scanner(System.in);

        System.out.println("Inserisci il nome dello show :");
        String nome = in.nextLine();
        System.out.println("Inserisci la via :");
        String via = in.nextLine();
        System.out.println("Inserisci il civico :");
        String civico = in.nextLine();
        System.out.println("Inserisci il cap : ");
        String cap = in.nextLine();
        System.out.println("Inserisci il giorno :");
        String giorno = in.nextLine();
        System.out.println("Inserisci l'orario di inizio (HH:MM:SS)");
        String ora = in.nextLine();

        try {
            if (DatabaseUtils.inserisciShow(nome, via, civico, cap, giorno, getFormattedTime(ora)) == 1)
                System.out.println("Inserimento avvenuto con successo");
        } catch (PatternSyntaxException | NumberFormatException e) {
            System.out.println("Inserirsci un formato di orario valido !!!");
        }
    }

    private static void modifica() {
        Scanner in = new Scanner(System.in);

        DatabaseUtils.elencaShow();
        System.out.println("Digita il nome dello show che vuoi modificare :");
        String nome = in.nextLine();
        if (DatabaseUtils.cercaShow(nome) == 0) {
            System.out.println("MusicShow non trovato,ritorno al menu principale");
            return;
        }
        System.out.println("Digita il nome dell'attributo che vuoi modificare :");
        String attributo = in.nextLine();
        System.out.println("Digita il nuovo valore da assegnare al seguente attributo :");
        String valore = in.nextLine();

        if (DatabaseUtils.modficaShow(nome, attributo, valore) == 1)
            System.out.println("Modifica avvenuta con successo");
    }

    private static void eliminazione() {
        Scanner in = new Scanner(System.in);

        DatabaseUtils.elencaShow();
        System.out.println("Digita il nome dello show che vuoi eliminare :");
        String nome = in.nextLine();

        if (DatabaseUtils.eliminaShow(nome) == 1)
            System.out.println("Eliminazione avvenuta con successo");
        else
            System.out.println("Nessuna riga è stata elminata,verifica di aver inserito correttamene il nome dello show !!!");
    }

    private static void query1() {
        DatabaseUtils.executeQuery1();
    }

    public static void main(String[] args) throws IOException {
        int scelta;

        while (true) {
            scelta = menu();

            switch (scelta) {
                case 0:
                    System.exit(0);
                    break;
                case 1:
                    DatabaseUtils.elencaShow();
                    break;
                case 2:
                    inserimento();
                    break;
                case 3:
                    modifica();
                    break;
                case 4:
                    eliminazione();
                    break;
                case 5:
                    query1();
                    break;
                default:
                    System.out.println("Inserire un valore valido !!!");
                    break;
            }
        }
    }
}