
$(function () {


    $(window).hashChange(fillgrid);


    $('#divTravels').click(function (e) {

        document.getElementById('ckbBusType').style.display = 'none';
        document.getElementById('ckbBoardingPoint').style.display = 'none';
        document.getElementById('ckbDroppingPoint').style.display = 'none';


        if (document.getElementById('ckbdivTravels').style.display == 'none') {
            $('#ckbdivTravels').slideDown("slow");
            e.stopPropagation();
        }
        else {
            $('#ckbdivTravels').slideToggle("slow");
        }

    });

    $('#divBusType').click(function (e) {
        document.getElementById('ckbdivTravels').style.display = 'none';
        document.getElementById('ckbBoardingPoint').style.display = 'none';
        document.getElementById('ckbDroppingPoint').style.display = 'none';

        if (document.getElementById('ckbBusType').style.display == 'none') {
            $('#ckbBusType').slideDown("slow");
            e.stopPropagation();
        }
        else {
            $('#ckbBusType').slideToggle("slow");
        }
    });
    $('#divBoardingpoing').click(function (e) {

        document.getElementById('ckbdivTravels').style.display = 'none';
        document.getElementById('ckbBusType').style.display = 'none';
        document.getElementById('ckbDroppingPoint').style.display = 'none';

        if (document.getElementById('ckbBoardingPoint').style.display == 'none') {
            $('#ckbBoardingPoint').slideDown("slow");
            e.stopPropagation();
        }
        else {
            $('#ckbBoardingPoint').slideToggle("slow");
        }
    });
    $('#divDropingpoints').click(function (e) {

        document.getElementById('ckbdivTravels').style.display = 'none';
        document.getElementById('ckbBusType').style.display = 'none';
        document.getElementById('ckbBoardingPoint').style.display = 'none';

        if (document.getElementById('ckbDroppingPoint').style.display == 'none') {
            $('#ckbDroppingPoint').slideDown("slow");
            e.stopPropagation();
        }
        else {
            $('#ckbDroppingPoint').slideToggle("slow");
        }
    });
    $(function () {
        $('.divcancel').click(function (e) {
            e.stopPropagation();
        });
        $("#DisCancdiv").click(function () {
            $(this).css('display', 'none');
        });
    });

    $('#divModify').click(function (e) {
        $('#divfilter').slideUp("slow");
        $('#divModifyBuses').slideToggle("slow");
    });
    $('#btnFilter').click(function (e) {
        $('#divModifyBuses').slideUp("slow");
        $('#divfilter').slideToggle("slow");
    });

    $("#Cancelclose").click(function () {
        $('#DisCancdiv').css('display', 'none');
    });
});

$(document).click(function (e) {
    $('#ckbdivTravels').click(function (e) {
        e.stopPropagation();
    });
    $('#ckbBusType').click(function (e) { e.stopPropagation(); });
    $('#ckbBoardingPoint').click(function (e) { e.stopPropagation(); });
    $('#ckbDroppingPoint').click(function (e) { e.stopPropagation(); });

    $('#ckbdivTravels').slideUp("slow");
    $('#ckbBusType').slideUp("slow");
    $('#ckbBoardingPoint').slideUp("slow");
    $('#ckbDroppingPoint').slideUp("slow");
});


var stationslist = [{ "id": "3", "label": "Hyderabad" }, { "id": "58", "label": "Visakhapatnam" }, { "id": "22", "label": "Rajahmundry" }, { "id": "99", "label": "Eluru" }, { "id": "150", "label": "Tanuku (By-Pass)" }, { "id": "27", "label": "Anakapalli" }, { "id": "5", "label": "Vijayawada" }, { "id": "15", "label": "Guntur" }, { "id": "56", "label": "Chilakaluripet" }, { "id": "72", "label": "Tanuku" }, { "id": "132", "label": "Gannavaram" }, { "id": "131", "label": "Hanuman Junction" }, { "id": "163", "label": "Kolkata" }, { "id": "2332", "label": "Kolkata(IBT)" }, { "id": "547", "label": "Kolkata(Esplanade)" }, { "id": "164", "label": "Asansol" }, { "id": "165", "label": "Durgapur" }, { "id": "171", "label": "Panagarh" }, { "id": "168", "label": "Siliguri" }, { "id": "7", "label": "Bangalore" }, { "id": "6", "label": "Chennai" }, { "id": "26", "label": "Ongole" }, { "id": "11", "label": "Nellore" }, { "id": "24", "label": "Kavali" }, { "id": "87", "label": "Sullurupeta (By-Pass)" }, { "id": "86", "label": "Naidupeta (By-Pass)" }, { "id": "216", "label": "Puri" }, { "id": "215", "label": "Bhubaneswar" }, { "id": "4", "label": "Mumbai" }, { "id": "51", "label": "Pune" }, { "id": "339", "label": "Lucknow" }, { "id": "323", "label": "Varanasi" }, { "id": "29", "label": "Annavaram" }, { "id": "28", "label": "Tuni" }, { "id": "71", "label": "Ravulapalem" }, { "id": "30", "label": "Jaggampet" }, { "id": "848", "label": "S.Konda By-Pass" }, { "id": "21", "label": "Kakinada" }, { "id": "42", "label": "Peddapuram" }, { "id": "41", "label": "Samarlakota" }, { "id": "45", "label": "Kovvuru" }, { "id": "47", "label": "Devarpalli" }, { "id": "12", "label": "Tirupathi" }, { "id": "130", "label": "Chittoor" }, { "id": "79", "label": "Bhimavaram" }, { "id": "80", "label": "Juvvalapalem" }, { "id": "83", "label": "Gudivada" }, { "id": "82", "label": "Mudinepally" }, { "id": "324", "label": "Kanpur" }, { "id": "239", "label": "Agra" }, { "id": "368", "label": "Gorakhpur" }, { "id": "152", "label": "Nagpur" }, { "id": "411", "label": "Tanguturu" }, { "id": "52", "label": "Vijayanagaram" }, { "id": "445", "label": "Bhadrachalam" }, { "id": "446", "label": "Palavancha" }, { "id": "447", "label": "Kothagudem" }, { "id": "60", "label": "Prathipadu" }, { "id": "656", "label": "Yarravaram" }, { "id": "65", "label": "Yelamanchalli" }, { "id": "766", "label": "Nakkapalli" }, { "id": "799", "label": "Adduroad" }, { "id": "241", "label": "Jaipur" }, { "id": "146", "label": "T P Gudem (Bye-Pass)" }, { "id": "542", "label": "Marturu" }, { "id": "85", "label": "Guduru (By-Pass)" }, { "id": "133", "label": "Narsapuram" }, { "id": "78", "label": "Palakollu" }, { "id": "96", "label": "Veeravasaram" }, { "id": "94", "label": "Undi" }, { "id": "92", "label": "Akiveedu" }, { "id": "93", "label": "kaikaluru" }, { "id": "95", "label": "Mandavalli" }, { "id": "344", "label": "Delhi" }, { "id": "49", "label": "Shirdi" }, { "id": "245", "label": "Ahmednagar" }, { "id": "159", "label": "Zaheerabad" }, { "id": "2266", "label": "Sangareddy" }, { "id": "343", "label": "Allahabad" }, { "id": "112", "label": "Anantapur" }, { "id": "2077", "label": "Tadipathri" }, { "id": "790", "label": "Tadipatri" }, { "id": "870", "label": "Vellore" }, { "id": "880", "label": "Palamaneru" }, { "id": "879", "label": "Punganuru" }, { "id": "658", "label": "Madanapalli" }, { "id": "885", "label": "Proddatur" }, { "id": "1900", "label": "Palamaner" }, { "id": "73", "label": "Tadepalligudem" }, { "id": "1057", "label": "Bellary" }, { "id": "1058", "label": "Sindhanur" }, { "id": "1137", "label": "Siriguppa" }, { "id": "55", "label": "Narasaraopet" }, { "id": "510", "label": "Medarametla" }, { "id": "102", "label": "Goa" }, { "id": "695", "label": "Belgaum" }, { "id": "883", "label": "Bidar" }, { "id": "1167", "label": "Gulbarga" }, { "id": "151", "label": "Gajuwaka" }, { "id": "951", "label": "Pondicherry(Puducherry)" }, { "id": "1133", "label": "DhindiVanam" }, { "id": "1134", "label": "Ranipet" }, { "id": "16", "label": "Chirala" }, { "id": "17", "label": "Bapatla" }, { "id": "18", "label": "Ponnur" }, { "id": "33", "label": "Railway Koduru" }, { "id": "34", "label": "Rajampet" }, { "id": "697", "label": "Bhusawal" }, { "id": "244", "label": "Jalgaon" }, { "id": "841", "label": "Dhule" }, { "id": "249", "label": "Malegaon" }, { "id": "780", "label": "Erandol" }, { "id": "779", "label": "Parola" }, { "id": "50", "label": "Srikakulam" }, { "id": "715", "label": "Jalna" }, { "id": "101", "label": "Aurangabad" }, { "id": "57", "label": "Kurnool" }, { "id": "1062", "label": "Adoni" }, { "id": "1130", "label": "Damalacheruv" }, { "id": "871", "label": "Pileru" }, { "id": "872", "label": "Rayachoti" }, { "id": "726", "label": "Udgir" }, { "id": "730", "label": "Latur" }, { "id": "1161", "label": "Tekkali" }, { "id": "1162", "label": "Narsannapeta" }, { "id": "308", "label": "Mandapet" }, { "id": "309", "label": "Alamuru" }, { "id": "315", "label": "Machavaram" }, { "id": "407", "label": "RC Puram" }, { "id": "1102", "label": "Karapa" }, { "id": "1103", "label": "Velangi" }, { "id": "1125", "label": "Kothuru" }, { "id": "13", "label": "Kadapa" }, { "id": "1288", "label": "Pullampet" }, { "id": "2385", "label": "Edurlanka(Bridge)" }, { "id": "67", "label": "Muramalla" }, { "id": "68", "label": "Mummidivaram" }, { "id": "233", "label": "Mahipalacheruvu" }, { "id": "234", "label": "Anathavaram" }, { "id": "20", "label": "Amalapuram" }, { "id": "69", "label": "Ambajipeta" }, { "id": "236", "label": "Mukkamala" }, { "id": "237", "label": "Avidi" }, { "id": "70", "label": "Kothapeta" }, { "id": "75", "label": "Tatipaka" }, { "id": "19", "label": "Razole" }, { "id": "98", "label": "Munganda" }, { "id": "1192", "label": "Nuzvid" }, { "id": "1195", "label": "Kuppam" }, { "id": "654", "label": "Kadhiri" }, { "id": "1223", "label": "V.Kota" }, { "id": "1101", "label": "Manuguru" }, { "id": "1211", "label": "Aswapuram" }, { "id": "926", "label": "Mysore" }, { "id": "1225", "label": "Srirangapatnam" }, { "id": "1224", "label": "Mandya" }, { "id": "1061", "label": "Hospet" }, { "id": "1060", "label": "Gangawati" }, { "id": "1154", "label": "Karllapalem" }, { "id": "536", "label": "Reddypalem" }, { "id": "1155", "label": "Chandolu" }, { "id": "272", "label": "Narayanapuram" }, { "id": "1278", "label": "Unguturu" }, { "id": "310", "label": "Kaikaram" }, { "id": "467", "label": "Bhimadolu" }, { "id": "311", "label": "Pulla" }, { "id": "478", "label": "Nidadavolu" }, { "id": "474", "label": "Brahmanagudem" }, { "id": "476", "label": "Chagallu" }, { "id": "46", "label": "Pangidi" }, { "id": "482", "label": "Devarapally" }, { "id": "487", "label": "Madduru" }, { "id": "1282", "label": "Vadapalli" }, { "id": "1283", "label": "Vijjeshwaram" }, { "id": "486", "label": "Unagatla" }, { "id": "741", "label": "Duddukuru" }, { "id": "489", "label": "Gopalapuram" }, { "id": "408", "label": "Koyyalagudem" }, { "id": "48", "label": "Jangareddy Gudem" }, { "id": "862", "label": "Baliya" }, { "id": "502", "label": "Mydukur" }, { "id": "745", "label": "Osmanabad" }, { "id": "744", "label": "Tuljapur" }, { "id": "106", "label": "Sholapur" }, { "id": "44", "label": "Raja Nagaram" }, { "id": "66", "label": "Edurlanka" }, { "id": "25", "label": "S.Konda" }, { "id": "157", "label": "Humnabad" }, { "id": "396", "label": "Dehradun" }, { "id": "43", "label": "Rangampeta" }, { "id": "1299", "label": "Giddalur" }, { "id": "1280", "label": "Nandyala" }, { "id": "2249", "label": "Komarolu" }, { "id": "2226", "label": "Nandyal" }, { "id": "894", "label": "Dharwad" }, { "id": "898", "label": "Hubli" }, { "id": "2236", "label": "Markapuram" }, { "id": "2234", "label": "Beestavaripeta" }, { "id": "2233", "label": "Racharla" }, { "id": "918", "label": "Cumbum" }, { "id": "1237", "label": "Rajam" }, { "id": "2384", "label": "Martur" }, { "id": "500", "label": "Jagannapeta" }, { "id": "77", "label": "Chinchinada" }, { "id": "238", "label": "Sidhantham" }, { "id": "129", "label": "Ongole(By-Pass)" }, { "id": "230", "label": "Jakkaram" }, { "id": "134", "label": "Kalla" }, { "id": "231", "label": "Elurupadu" }, { "id": "136", "label": "Korukollu" }, { "id": "81", "label": "Kalidindi" }, { "id": "435", "label": "Bareilly" }, { "id": "2295", "label": "Delhi (Sarai Kale Khan)" }, { "id": "2294", "label": "Delhi (Ajmeri Gate)" }, { "id": "2297", "label": "Saluru" }, { "id": "2296", "label": "Rambhadrapuram" }, { "id": "74", "label": "P. Gannavaram" }, { "id": "278", "label": "Bandarulanka" }, { "id": "641", "label": "Komaragiri Patnam" }, { "id": "313", "label": "Gollapalem" }, { "id": "314", "label": "Draksharamam" }, { "id": "488", "label": "Kotturu" }, { "id": "2309", "label": "Jagannadhagiri" }, { "id": "149", "label": "Dwarapudi" }, { "id": "148", "label": "Anaparthi" }, { "id": "472", "label": "Bikkavolu" }, { "id": "288", "label": "Kadiyam" }, { "id": "2310", "label": "Dowlaiswaram" }, { "id": "2308", "label": "Dommeru" }, { "id": "35", "label": "Vetapalem" }, { "id": "538", "label": "Epurupalem" }, { "id": "2314", "label": "Desapeta" }, { "id": "469", "label": "Chebrolu" }, { "id": "2313", "label": "Yedullapalli" }, { "id": "2312", "label": "Appikatla" }, { "id": "2311", "label": "Thatiparru" }, { "id": "279", "label": "Pulletikurru" }, { "id": "479", "label": "Pallamkuru" }, { "id": "283", "label": "Annavarapadu" }, { "id": "285", "label": "Peravali" }, { "id": "97", "label": "Srungavruksham" }, { "id": "2298", "label": "Muktheswaram " }, { "id": "2302", "label": "Siripalli" }, { "id": "2301", "label": "Vilasa" }, { "id": "2300", "label": "Vemavaram" }, { "id": "2299", "label": "Black Bridge" }, { "id": "1171", "label": "Raichur" }, { "id": "1163", "label": "Manvi" }, { "id": "1196", "label": "Karatagi" }, { "id": "1168", "label": "De Sai Camp" }, { "id": "1312", "label": "Shaktinagar" }, { "id": "678", "label": "Panjim" }, { "id": "677", "label": "Mapusa" }, { "id": "674", "label": "Sawantwadi" }, { "id": "1394", "label": "Banda" }, { "id": "785", "label": "Kankavli" }, { "id": "509", "label": "Kandukuru" }, { "id": "53", "label": "Tenali" }, { "id": "36", "label": "Sathenpalli" }, { "id": "2327", "label": "Pitapuram" }, { "id": "1169", "label": "Amareshwar Camp" }, { "id": "2356", "label": "Kartigi" }, { "id": "2357", "label": "Basavapatna" }, { "id": "2358", "label": "Budugumpa Cross" }, { "id": "1747", "label": "Kushtagi" }, { "id": "1604", "label": "Ilkal" }, { "id": "336", "label": "Jhansi" }, { "id": "1129", "label": "Toranagallu" }, { "id": "792", "label": "Guntakal" }, { "id": "2479", "label": "Kampli" }, { "id": "2435", "label": "Mantralaya" }, { "id": "1064", "label": "Yemmiganur" }, { "id": "281", "label": "Peruru" }, { "id": "2475", "label": "Yeraguntla" }, { "id": "1826", "label": "Muddanur" }, { "id": "2774", "label": "Kalakada" }, { "id": "108", "label": "Nanded" }, { "id": "2493", "label": "Basmath" }, { "id": "1921", "label": "Parbhani" }, { "id": "1635", "label": "Jintur" }, { "id": "2491", "label": "Mantha" }, { "id": "89", "label": "Mamidikuduru" }, { "id": "90", "label": "Nagaram" }, { "id": "91", "label": "Lakkavaram" }, { "id": "2496", "label": "Battalanka" }, { "id": "76", "label": "Malkipuram" }, { "id": "463", "label": "Shivakodu" }, { "id": "455", "label": "Lankala Koderu" }, { "id": "3927", "label": "Sankeshwar By Pass" }, { "id": "3926", "label": "Nipanni By Pass" }, { "id": "518", "label": "Vedullapally" }, { "id": "3991", "label": "Kollipara" }, { "id": "3994", "label": "Toomuluru" }, { "id": "3995", "label": "Athota" }, { "id": "3847", "label": "Duggirala" }, { "id": "1090", "label": "Revendrapadu" }, { "id": "3851", "label": "Pedavadlapudi" }, { "id": "1086", "label": "Mangalagiri (Bye-Pass)" }, { "id": "3989", "label": "Repalle" }, { "id": "3849", "label": "Gudavalli" }, { "id": "3846", "label": "Cherukupalli" }, { "id": "3848", "label": "Govada" }, { "id": "3845", "label": "Amruthalur" }, { "id": "3850", "label": "Pedapudi" }, { "id": "3988", "label": "Kuchipudi" }, { "id": "3987", "label": "Pedaravuru" }, { "id": "3986", "label": "Angalakoduru" }, { "id": "3985", "label": "Sangam Jagallamudi" }, { "id": "3600", "label": "Vadlamudi" }, { "id": "3602", "label": "Vignan Lara College" }, { "id": "3595", "label": "Narakoduru" }, { "id": "899", "label": "Piduguralla" }, { "id": "3996", "label": "Mogalturu" }, { "id": "3206", "label": "Udankudi" }, { "id": "2112", "label": "Thisayanvilai" }, { "id": "2123", "label": "Tirunelveli" }, { "id": "4050", "label": "Parappadi" }, { "id": "905", "label": "Thrissur" }, { "id": "906", "label": "Palakkad" }, { "id": "794", "label": "Coimbatore" }, { "id": "868", "label": "Salem" }, { "id": "907", "label": "Alapuzha" }, { "id": "908", "label": "Aluva" }, { "id": "909", "label": "Anakara" }, { "id": "910", "label": "Angamaly" }, { "id": "911", "label": "Attingal" }, { "id": "912", "label": "Calicut" }, { "id": "913", "label": "Alathur" }, { "id": "914", "label": "Chalakudy" }, { "id": "915", "label": "Changanassery" }, { "id": "916", "label": "Chengannur" }, { "id": "917", "label": "Cherthala" }, { "id": "919", "label": "Dindigal" }, { "id": "921", "label": "Kuruvilangadu" }, { "id": "922", "label": "Mananthavaadi" }, { "id": "923", "label": "Moonupeedika" }, { "id": "924", "label": "Moovattupuzha" }, { "id": "925", "label": "Munnar (by pickup van)" }, { "id": "928", "label": "Kalpetta" }, { "id": "929", "label": "Kanjirappally" }, { "id": "931", "label": "Karunagapilly" }, { "id": "932", "label": "Kattappana" }, { "id": "933", "label": "Kayamkulam" }, { "id": "934", "label": "Kazhakoottam" }, { "id": "935", "label": "Kodungalore" }, { "id": "936", "label": "Kollam" }, { "id": "937", "label": "Koothattukulam" }, { "id": "939", "label": "Kottakkal" }, { "id": "940", "label": "Kottarakkara" }, { "id": "941", "label": "Kottayam" }, { "id": "942", "label": "Kozhenchery" }, { "id": "943", "label": "Kozhikode" }, { "id": "944", "label": "Kumily" }, { "id": "946", "label": "Pandalam" }, { "id": "948", "label": "Pathanapuram" }, { "id": "949", "label": "Pathanamthitta" }, { "id": "950", "label": "Perumbavoor" }, { "id": "953", "label": "Ranny" }, { "id": "954", "label": "Sulthan Bathery" }, { "id": "955", "label": "Thamarassery" }, { "id": "956", "label": "Theni" }, { "id": "957", "label": "Thiruvalla" }, { "id": "958", "label": "Thiruvananthapuram" }, { "id": "959", "label": "Thodupuzha" }, { "id": "961", "label": "Muringassery" }, { "id": "962", "label": "Tripunithura" }, { "id": "964", "label": "Vaikom" }, { "id": "965", "label": "Vythiri" }, { "id": "530", "label": "Ernakulam" }, { "id": "966", "label": "Erumely" }, { "id": "967", "label": "Guruvayoor" }, { "id": "968", "label": "Haripad" }, { "id": "533", "label": "Hosur" }, { "id": "969", "label": "Irinjalakuda" }, { "id": "970", "label": "Kalamassery" }, { "id": "971", "label": "Adoor" }, { "id": "972", "label": "Kunnamangalam" }, { "id": "973", "label": "Vadakkanchery" }, { "id": "975", "label": "Koduvally" }, { "id": "976", "label": "Eengapuzha" }, { "id": "978", "label": "thalayolaparambu" }, { "id": "979", "label": "kalady" }, { "id": "980", "label": "Edapal" }, { "id": "981", "label": "Kunnamkulam" }, { "id": "982", "label": "Ettumanoor" }, { "id": "984", "label": "Kondotti" }, { "id": "985", "label": "Malapuram" }, { "id": "986", "label": "Perinthalmanna" }, { "id": "991", "label": "Pathiripala" }, { "id": "993", "label": "Ottapaalam" }, { "id": "996", "label": "Pattambi" }, { "id": "1002", "label": "Edapalroad(Koottanad)" }, { "id": "1003", "label": "Walayar" }, { "id": "1004", "label": "Chavadi" }, { "id": "1005", "label": "Kanjikode" }, { "id": "1007", "label": "Edappally " }, { "id": "1008", "label": "Koratty" }, { "id": "1009", "label": "Bathal Gundu" }, { "id": "1013", "label": "Kodai Road" }, { "id": "1014", "label": "palani" }, { "id": "1016", "label": "Madurai" }, { "id": "1017", "label": "kodakara" }, { "id": "1023", "label": "Ponkunnam" }, { "id": "1024", "label": "Monipalli " }, { "id": "1067", "label": "Dharmapuri" }, { "id": "1514", "label": "Dharamshala" }, { "id": "882", "label": "Tirupur (Avinashi)" }, { "id": "747", "label": "Avinasi" }, { "id": "1080", "label": "Perundurai" }, { "id": "881", "label": "Krishnagiri" }, { "id": "897", "label": "Davanagere" }, { "id": "1511", "label": "Dewas" }, { "id": "1512", "label": "Dhar" }, { "id": "867", "label": "Erode" }, { "id": "673", "label": "Kolhapur" }, { "id": "9", "label": "Naidupeta" }, { "id": "2062", "label": "Srikalahasthi" }, { "id": "1018", "label": "Kopam Byepass" }, { "id": "2229", "label": "Wadakkanchery" }, { "id": "1955", "label": "Puthuchery" }, { "id": "2133", "label": "Trichur" }, { "id": "1304", "label": "kondotty" }, { "id": "2136", "label": "Trivandrum" }, { "id": "1728", "label": "Kovilpatti" }, { "id": "1800", "label": "Marthandam" }, { "id": "1852", "label": "Nagercoil" }, { "id": "2273", "label": "Parasala" }, { "id": "2104", "label": "Thirumangalam" }, { "id": "2167", "label": "Valliyur" }, { "id": "2274", "label": "Viruthunagar" }, { "id": "2275", "label": "Alleppy" }, { "id": "2277", "label": "Chenkalpattu" }, { "id": "1523", "label": "Dindigul" }, { "id": "1119", "label": "Gooty" }, { "id": "2279", "label": "Kalikkavilai" }, { "id": "531", "label": "Cochin" }, { "id": "2363", "label": "Gundalpet" }, { "id": "2362", "label": "Nanjangudu" }, { "id": "2373", "label": "Thampanoor" }, { "id": "2374", "label": "Valanchery" }, { "id": "2375", "label": "Kuttipuram" }, { "id": "2376", "label": "Kavalkinar" }, { "id": "2377", "label": "Palghat" }, { "id": "2378", "label": "Tirur(Edarikode)" }, { "id": "2379", "label": "Tindivanam" }, { "id": "2380", "label": "Pampady" }, { "id": "2381", "label": "Vilupuram" }, { "id": "2382", "label": "Vadaserikkara" }, { "id": "1839", "label": "Mundakayam" }, { "id": "927", "label": "Pala" }, { "id": "2433", "label": "kurupumthara" }, { "id": "2063", "label": "Sriperumbudur" }, { "id": "1206", "label": "Manipal" }, { "id": "884", "label": "Mangalore" }, { "id": "2449", "label": "Payyanur" }, { "id": "2450", "label": "Kanjangad" }, { "id": "1676", "label": "Kasargod" }, { "id": "2451", "label": "Manjeshwaram" }, { "id": "2447", "label": "Mangalapuram" }, { "id": "1666", "label": "Kannur(cannanore)" }, { "id": "2092", "label": "Thalassery" }, { "id": "1038", "label": "Udupi" }, { "id": "2476", "label": "Mahi" }, { "id": "2139", "label": "Tumkur" }, { "id": "1475", "label": "Chitradurga" }, { "id": "719", "label": "Satara" }, { "id": "2515", "label": "Aanjangaon" }, { "id": "2516", "label": "Aanjar" }, { "id": "2517", "label": "Aathankarai" }, { "id": "2518", "label": "Abu" }, { "id": "1339", "label": "Abu Road" }, { "id": "1340", "label": "Adipur" }, { "id": "1341", "label": "Adirampattinam" }, { "id": "2520", "label": "Agra Fort" }, { "id": "242", "label": "Ahmedabad" }, { "id": "731", "label": "Ahmedpur" }, { "id": "2521", "label": "Ailnabad" }, { "id": "808", "label": "Ajanta" }, { "id": "1345", "label": "Ajmer" }, { "id": "306", "label": "Akividu" }, { "id": "246", "label": "Akola" }, { "id": "2523", "label": "Akolawadi" }, { "id": "1346", "label": "Akot" }, { "id": "2524", "label": "Alagankulam" }, { "id": "2525", "label": "Alakode" }, { "id": "845", "label": "Allagadda" }, { "id": "1354", "label": "Alwar" }, { "id": "2528", "label": "Alwarthirunagari" }, { "id": "1355", "label": "Alwaye" }, { "id": "2529", "label": "Amalner" }, { "id": "2530", "label": "Amarnath Yatra" }, { "id": "1356", "label": "Ambaji" }, { "id": "2531", "label": "Ambajogai" }, { "id": "2532", "label": "Ambala" }, { "id": "2533", "label": "Ambalner" }, { "id": "1357", "label": "Ambasamutram" }, { "id": "2534", "label": "Ambattur" }, { "id": "2536", "label": "Amber Fort" }, { "id": "1359", "label": "Ambur" }, { "id": "1361", "label": "Amet" }, { "id": "1362", "label": "Amingad" }, { "id": "1364", "label": "Amravati" }, { "id": "2251", "label": "Ananthapur" }, { "id": "2539", "label": "Angallu" }, { "id": "687", "label": "Ankleshwar" }, { "id": "1045", "label": "Ankola" }, { "id": "2540", "label": "Anupgarh" }, { "id": "1368", "label": "Aranthangi" }, { "id": "2541", "label": "Aravali" }, { "id": "2542", "label": "Areekode" }, { "id": "1370", "label": "Ariyalur" }, { "id": "2543", "label": "Arjunsar" }, { "id": "1371", "label": "Armoor" }, { "id": "1372", "label": "Aroor" }, { "id": "2544", "label": "Arsikere" }, { "id": "1374", "label": "Aruppukottai" }, { "id": "409", "label": "Aswaraopeta" }, { "id": "2546", "label": "Athangudi" }, { "id": "198", "label": "Athirampattinam" }, { "id": "1376", "label": "Athiyuthu" }, { "id": "38", "label": "Atmakur" }, { "id": "506", "label": "Atreyapuram" }, { "id": "2548", "label": "Atthikadai" }, { "id": "266", "label": "Attili" }, { "id": "1377", "label": "Attur" }, { "id": "1380", "label": "Avadi" }, { "id": "2549", "label": "Avanam" }, { "id": "2551", "label": "Ayarkunnum" }, { "id": "2552", "label": "Ayikkarapadi" }, { "id": "2555", "label": "Azhagankulam" }, { "id": "2557", "label": "B.D.AJunction\/LeeMeridian" }, { "id": "2561", "label": "BadiSadri" }, { "id": "2571", "label": "Balehonnur" }, { "id": "2572", "label": "Balmer" }, { "id": "1392", "label": "Balotra" }, { "id": "1393", "label": "Banahatti" }, { "id": "705", "label": "Bangla" }, { "id": "727", "label": "Barshi" }, { "id": "2577", "label": "Baswada" }, { "id": "1406", "label": "Batala" }, { "id": "1407", "label": "Bathalagundu" }, { "id": "2578", "label": "Bathalapalli" }, { "id": "2579", "label": "Batva" }, { "id": "1413", "label": "Belthangady" }, { "id": "2583", "label": "Bhadravati" }, { "id": "2584", "label": "Bhalgam" }, { "id": "670", "label": "Bharuch" }, { "id": "1042", "label": "Bhatkal" }, { "id": "258", "label": "Bundi" }, { "id": "2604", "label": "Burgur" }, { "id": "2612", "label": "Chalal" }, { "id": "2614", "label": "Chalisgaon" }, { "id": "2615", "label": "Chalode" }, { "id": "1461", "label": "Chandigarh" }, { "id": "2617", "label": "Chandrai" }, { "id": "809", "label": "Chandrapur" }, { "id": "2618", "label": "ChandurBazar" }, { "id": "2620", "label": "Changaveti" }, { "id": "2623", "label": "Chavakkad" }, { "id": "2271", "label": "Chithode" }, { "id": "2639", "label": "Chittode Byepass" }, { "id": "2641", "label": "Cholingar" }, { "id": "760", "label": "Chotila" }, { "id": "2644", "label": "Chowk" }, { "id": "1485", "label": "Coonoor" }, { "id": "2652", "label": "Deedwana" }, { "id": "1501", "label": "Deepnagar" }, { "id": "1502", "label": "Deesa" }, { "id": "2653", "label": "Degana" }, { "id": "2655", "label": "Dehra" }, { "id": "2661", "label": "Devgad" }, { "id": "2662", "label": "Devgalraja" }, { "id": "2669", "label": "Dharmajchowkdi" }, { "id": "1517", "label": "Dharmasthala" }, { "id": "2672", "label": "Dharva" }, { "id": "1518", "label": "Dharwa" }, { "id": "1527", "label": "Dongaon" }, { "id": "2698", "label": "Erikode" }, { "id": "2702", "label": "Fathenagar" }, { "id": "1543", "label": "Gadag" }, { "id": "269", "label": "Ganapavaram" }, { "id": "1556", "label": "Gokak" }, { "id": "504", "label": "Gouripatnam" }, { "id": "1564", "label": "Gudhshisha" }, { "id": "252", "label": "Guna" }, { "id": "1573", "label": "Guruvayankere" }, { "id": "406", "label": "Haldwani" }, { "id": "2722", "label": "Halvad" }, { "id": "2723", "label": "Hanumangadh" }, { "id": "397", "label": "Haridwar" }, { "id": "2726", "label": "Haridwar Rishikesh tour" }, { "id": "2727", "label": "Harur" }, { "id": "1585", "label": "Hathgoan" }, { "id": "2730", "label": "Hedvi" }, { "id": "1590", "label": "Himmatnagar" }, { "id": "1075", "label": "Hindupur" }, { "id": "2737", "label": "Ilkal By Pass" }, { "id": "2740", "label": "Irrikkur" }, { "id": "1618", "label": "Jalor" }, { "id": "1622", "label": "Jammu" }, { "id": "1626", "label": "Jetpur" }, { "id": "1627", "label": "Jewargi" }, { "id": "1630", "label": "Jhalawar" }, { "id": "2764", "label": "Jhalod" }, { "id": "1631", "label": "Jhalrapatan" }, { "id": "2765", "label": "Jhunjhunu" }, { "id": "2766", "label": "Jim Corbett National Park" }, { "id": "1633", "label": "Jindal Power" }, { "id": "1636", "label": "Jodhpur" }, { "id": "1637", "label": "Jogfalls" }, { "id": "2767", "label": "Julwania" }, { "id": "1638", "label": "Junagadh" }, { "id": "1639", "label": "Kadaiyanallur" }, { "id": "493", "label": "Kadamanchali" }, { "id": "1641", "label": "Kadara" }, { "id": "708", "label": "Kadganchi" }, { "id": "836", "label": "Kadiri" }, { "id": "2769", "label": "Kadodra" }, { "id": "2770", "label": "Kadugli" }, { "id": "2771", "label": "Kadur" }, { "id": "1646", "label": "Kaiga" }, { "id": "1647", "label": "Kaikamba" }, { "id": "1648", "label": "Kaikatti" }, { "id": "1649", "label": "Kakroli" }, { "id": "2773", "label": "Kalahasthi" }, { "id": "1651", "label": "Kalamb" }, { "id": "2776", "label": "Kalasa" }, { "id": "2778", "label": "Kaleyakavelai" }, { "id": "2779", "label": "Kaliakkavilai" }, { "id": "40", "label": "Kaligiri" }, { "id": "1165", "label": "Kalikiri" }, { "id": "2780", "label": "Kalinda" }, { "id": "2781", "label": "Kallakurichi" }, { "id": "1657", "label": "Kallupatti" }, { "id": "2783", "label": "Kalluru" }, { "id": "2784", "label": "Kaloda" }, { "id": "2785", "label": "Kalol" }, { "id": "2787", "label": "Kalpakam" }, { "id": "749", "label": "Kalyan" }, { "id": "2788", "label": "Kamatagi" }, { "id": "2789", "label": "Kamera Gadh" }, { "id": "706", "label": "Kamlapur" }, { "id": "2790", "label": "Kamligadh" }, { "id": "692", "label": "Kamrej" }, { "id": "2791", "label": "Kanangad" }, { "id": "490", "label": "Kandavelli" }, { "id": "2792", "label": "Kandola" }, { "id": "2793", "label": "Kangra" }, { "id": "2794", "label": "kanhangad" }, { "id": "2795", "label": "Kankroli" }, { "id": "2796", "label": "Kannad" }, { "id": "2797", "label": "Kannavam" }, { "id": "1665", "label": "Kanniyakumari" }, { "id": "2798", "label": "Kannur" }, { "id": "1667", "label": "Kanyakumari" }, { "id": "2800", "label": "Kapu" }, { "id": "1670", "label": "Karaikudi" }, { "id": "1671", "label": "Kareda" }, { "id": "2801", "label": "Kargal" }, { "id": "1672", "label": "Karkala" }, { "id": "2804", "label": "Karungal" }, { "id": "786", "label": "Karur" }, { "id": "1675", "label": "Karwar" }, { "id": "832", "label": "Kasal" }, { "id": "2807", "label": "Kasaragod" }, { "id": "2808", "label": "Kashimira" }, { "id": "1682", "label": "Kavoor" }, { "id": "2814", "label": "Kazhakootam" }, { "id": "2815", "label": "Keelakam" }, { "id": "2824", "label": "Kharvada" }, { "id": "2825", "label": "Khatushyamji" }, { "id": "1708", "label": "Kodinar" }, { "id": "2840", "label": "Konapattu" }, { "id": "2847", "label": "Kotputali" }, { "id": "1733", "label": "Kukke Subramanya" }, { "id": "1744", "label": "Kuravilagad" }, { "id": "1752", "label": "Lad Karanja" }, { "id": "2866", "label": "Lakhan Pur" }, { "id": "2869", "label": "Laxmeswar" }, { "id": "2873", "label": "Losing" }, { "id": "1760", "label": "Ludhiana" }, { "id": "2876", "label": "Maanamadurai" }, { "id": "1766", "label": "Madukkur" }, { "id": "2881", "label": "Magaon" }, { "id": "722", "label": "Mahabaleshwar" }, { "id": "1771", "label": "Maksi" }, { "id": "1253", "label": "Malkapur" }, { "id": "1777", "label": "Manali" }, { "id": "2892", "label": "Mananthavady" }, { "id": "2893", "label": "Manavadar" }, { "id": "2894", "label": "Mancheri" }, { "id": "1249", "label": "Mandangad" }, { "id": "1780", "label": "Mandapam" }, { "id": "1781", "label": "Mandarthi" }, { "id": "1786", "label": "Mangalwad" }, { "id": "2898", "label": "Manglana" }, { "id": "2899", "label": "Mangrol" }, { "id": "2900", "label": "Mangrul Pir" }, { "id": "1789", "label": "Manki" }, { "id": "2904", "label": "Manmad" }, { "id": "1791", "label": "Mannakalli" }, { "id": "1792", "label": "Mannarkkad" }, { "id": "2907", "label": "Mansa" }, { "id": "465", "label": "Marteru" }, { "id": "2912", "label": "Mata Vaishno Devi Yatra" }, { "id": "1803", "label": "Matanomadh" }, { "id": "2922", "label": "Mehta Chowk" }, { "id": "1816", "label": "Mimisal" }, { "id": "2939", "label": "Mudrangandi" }, { "id": "2974", "label": "Naseerabad" }, { "id": "2975", "label": "Naseerabagh" }, { "id": "1868", "label": "Nashik" }, { "id": "1156", "label": "Nathdwara" }, { "id": "264", "label": "Natta Rameswaram" }, { "id": "1871", "label": "Navaghadh" }, { "id": "1883", "label": "Nimach" }, { "id": "1884", "label": "Nimaheda" }, { "id": "2994", "label": "Nippani" }, { "id": "2995", "label": "Nithiravilai" }, { "id": "1887", "label": "Nitte" }, { "id": "2997", "label": "Niwai" }, { "id": "3001", "label": "Nova" }, { "id": "1867", "label": "Narsaraopet" }, { "id": "3011", "label": "Orthanad" }, { "id": "3014", "label": "Paakkad By Pass" }, { "id": "3017", "label": "Palcot" }, { "id": "1905", "label": "Pali" }, { "id": "1906", "label": "Palitana" }, { "id": "1907", "label": "Palladam" }, { "id": "3018", "label": "Pallu" }, { "id": "3019", "label": "Palsam" }, { "id": "3026", "label": "Paramathivellore" }, { "id": "114", "label": "Parchur" }, { "id": "1922", "label": "Parkala" }, { "id": "3030", "label": "Parthibanur" }, { "id": "3031", "label": "Patan Vav" }, { "id": "1924", "label": "Pathankot" }, { "id": "1930", "label": "Periyakulam" }, { "id": "1931", "label": "Perungulam" }, { "id": "1934", "label": "Petnaka" }, { "id": "1935", "label": "Phagwara" }, { "id": "3048", "label": "Pili Bhanga" }, { "id": "3049", "label": "Pillayarpatti" }, { "id": "267", "label": "Pipara" }, { "id": "3053", "label": "Ponamaravathi" }, { "id": "3064", "label": "Pulingudi" }, { "id": "1949", "label": "Puliyangudi" }, { "id": "3067", "label": "Rajaldesher" }, { "id": "1964", "label": "Rajapalayam" }, { "id": "702", "label": "Rajapur" }, { "id": "1965", "label": "Rajgarh" }, { "id": "755", "label": "Rajkot" }, { "id": "1966", "label": "Rajnagar" }, { "id": "3069", "label": "Rajpura" }, { "id": "874", "label": "Rajula" }, { "id": "1968", "label": "Ramachandrapuram" }, { "id": "3070", "label": "Ramanattukara" }, { "id": "3071", "label": "Rambhari" }, { "id": "3072", "label": "Ramdevra" }, { "id": "351", "label": "Rampur" }, { "id": "1992", "label": "Samkhayali" }, { "id": "3100", "label": "Sanderav" }, { "id": "535", "label": "Sandolu" }, { "id": "3102", "label": "Sangameshwar" }, { "id": "1097", "label": "Sangli" }, { "id": "2000", "label": "Sangola" }, { "id": "3110", "label": "Satara-karad" }, { "id": "3114", "label": "Savarkundla" }, { "id": "3115", "label": "Savda" }, { "id": "3116", "label": "Sawada" }, { "id": "3117", "label": "Sayla" }, { "id": "2014", "label": "Seerkazhi" }, { "id": "3120", "label": "SeminarKoil" }, { "id": "3121", "label": "Sendva" }, { "id": "3128", "label": "Shipur" }, { "id": "2027", "label": "Shirali" }, { "id": "3153", "label": "Sujangadh" }, { "id": "2080", "label": "Talala" }, { "id": "716", "label": "Yeola" }, { "id": "3320", "label": "Kuthattukulam" }, { "id": "3374", "label": "Muloor" }, { "id": "1658", "label": "Kambadakone" }, { "id": "2094", "label": "Thallur" }, { "id": "1201", "label": "Mothadaka" }, { "id": "1899", "label": "Palakkad Bypass" }, { "id": "3712", "label": "Mangadasroad" }, { "id": "3713", "label": "Channagiri" }, { "id": "742", "label": "Mumbai(Borivali)" }, { "id": "3735", "label": "Tirupati-Tirumal-Kalahasti" }, { "id": "3736", "label": "Shridi-Nsk-Aurgbd-Shrdi(7D-6N)" }, { "id": "3737", "label": "Shirdi-Bng(4D - 3N)Pkg2" }, { "id": "3738", "label": "Shirdi- Nsk - Shrdi (5D - 4N)Pkg2" }, { "id": "3739", "label": "Shirdi- Nsk - SHRDI (5D - 4N)Pkg1" }, { "id": "3747", "label": "Ooty - Kodai(5D-4N)Pkg2" }, { "id": "3748", "label": "Ooty - Kodai(5D-4N)Pkg1" }, { "id": "3752", "label": "Ooty Coonoor Pkg3" }, { "id": "3753", "label": "Ooty Coonoor Pkg2" }, { "id": "3754", "label": "Ooty Coonoor Pkg1" }, { "id": "3755", "label": "Ooty Coonoor (1n 2d)" }, { "id": "3756", "label": "Ooty Coonoor " }, { "id": "3757", "label": "Ooty - Coonoor (6D - 5N)Pkg1" }, { "id": "3758", "label": "Ooty - Coonoor (5D - 4N)Pkg2" }, { "id": "3759", "label": "Ooty - Coonoor (5D - 4N)Pkg1" }, { "id": "3760", "label": "Ooty - Coonoor (4D - 3N)Pkg2 " }, { "id": "3761", "label": "Ooty - Coonoor (4D - 3N)Pkg1" }, { "id": "3762", "label": "Ooty Kodai Pkg 1" }, { "id": "3763", "label": "Ooty Coonoor (2d 3d)" }, { "id": "3771", "label": "Mysore Ooty(3d 3n)" }, { "id": "3795", "label": "Katra Drop" }, { "id": "3821", "label": "Kaduthruthy" }, { "id": "3822", "label": "Amballoor" }, { "id": "3825", "label": "Monipilly" }, { "id": "3826", "label": "Bairumbe" }, { "id": "3830", "label": "Mysore Ooty Kodia(1n 2n 2n) " }, { "id": "3831", "label": "Mysore Ooty Kodia(1n 2n 3n) " }, { "id": "3832", "label": "Mysore Ooty Kodia(1n 3n 2n) " }, { "id": "3833", "label": "Mysore Ooty Kodiakanal 1n 2n 1n" }, { "id": "3834", "label": "Mysore Ooty(1n 2n)" }, { "id": "3843", "label": "Bangalore Local" }, { "id": "3853", "label": "Houshiyapur" }, { "id": "3854", "label": "Kathua" }, { "id": "3855", "label": "Rookri" }, { "id": "3856", "label": "Roopar" }, { "id": "3857", "label": "Tanda" }, { "id": "2484", "label": "Bestavaripeta" }, { "id": "3858", "label": "Kallor" }, { "id": "3859", "label": "Kolluru Cross" }, { "id": "2306", "label": "Kadapa (By Pass)" }, { "id": "1580", "label": "Harapanahalli" }, { "id": "3881", "label": "Kuravilangad" }, { "id": "3887", "label": "Sirkali (Sirkazhi)" }, { "id": "1597", "label": "Hoshiarpur" }, { "id": "3889", "label": "Hosyapur" }, { "id": "3890", "label": "Hosyarpur" }, { "id": "3891", "label": "Munnuthy" }, { "id": "3892", "label": "Vedakkanchery" }, { "id": "3893", "label": "Balaramapuram" }, { "id": "3899", "label": "Paiga" }, { "id": "3903", "label": "Thiruthani" }, { "id": "3913", "label": "Bail Hongal" }, { "id": "1403", "label": "Basavakalyan" }, { "id": "3916", "label": "Goa(Panajim)" }, { "id": "795", "label": "Trichy" }, { "id": "1892", "label": "Ooty" }, { "id": "1508", "label": "Devakottai" }, { "id": "1813", "label": "Mettupalayam" }, { "id": "2197", "label": "Villupuram" }, { "id": "3207", "label": "Udumalaipet" }, { "id": "2184", "label": "Velankanni" }, { "id": "3964", "label": "Virthunagar" }, { "id": "1351", "label": "Alleppey" }, { "id": "3967", "label": "Pudhukottai" }, { "id": "3968", "label": "Dindugal" }, { "id": "2178", "label": "Vathalagundu" }, { "id": "3969", "label": "Cunoor" }, { "id": "1843", "label": "Munnar" }, { "id": "1554", "label": "Gobi" }, { "id": "3971", "label": "Oddanchataram" }, { "id": "2052", "label": "Sivakasi" }, { "id": "189", "label": "Karaikal" }, { "id": "1737", "label": "Kumbakonam" }, { "id": "191", "label": "Nagapattinam" }, { "id": "1488", "label": "Cuddalore" }, { "id": "1859", "label": "Namakkal" }, { "id": "3974", "label": "Trichendur" }, { "id": "1814", "label": "Mettur" }, { "id": "3979", "label": "Puliyampatty" }, { "id": "688", "label": "Anand" }, { "id": "1390", "label": "Baindoor" }, { "id": "672", "label": "Baroda" }, { "id": "4007", "label": "Davangere" }, { "id": "1522", "label": "Dhrol" }, { "id": "1594", "label": "Honnavar" }, { "id": "180", "label": "Islampur" }, { "id": "1329", "label": "Jamnagar" }, { "id": "4009", "label": "Kherwara" }, { "id": "4010", "label": "Kumtta" }, { "id": "4011", "label": "Limbdi" }, { "id": "680", "label": "Panchgani" }, { "id": "4012", "label": "Pethnaka" }, { "id": "671", "label": "Surat" }, { "id": "684", "label": "Thane" }, { "id": "669", "label": "Valsad" }, { "id": "668", "label": "Vapi" }, { "id": "724", "label": "Wai" }, { "id": "1330", "label": "Wai Phata" }, { "id": "1352", "label": "Almatti" }, { "id": "1383", "label": "Badami" }, { "id": "1389", "label": "Bailhongal" }, { "id": "1039", "label": "Brahmavar" }, { "id": "1454", "label": "Byndoor" }, { "id": "4019", "label": "Channarayapatna" }, { "id": "1470", "label": "Chikodi" }, { "id": "1496", "label": "Dandeli" }, { "id": "4020", "label": "Devdurga" }, { "id": "1557", "label": "Gokarna" }, { "id": "1568", "label": "Guledgudda" }, { "id": "1577", "label": "Haladi" }, { "id": "1581", "label": "Harihar" }, { "id": "4022", "label": "Hutti" }, { "id": "1098", "label": "Ichalkaranji" }, { "id": "1621", "label": "Jamkhandi" }, { "id": "4023", "label": "Jayasingpur" }, { "id": "4024", "label": "Jog falls" }, { "id": "721", "label": "Karad" }, { "id": "1710", "label": "Kokkarne" }, { "id": "1719", "label": "Koppal" }, { "id": "1724", "label": "Koteshwar" }, { "id": "1044", "label": "Kumta" }, { "id": "1741", "label": "Kundapur" }, { "id": "4032", "label": "kustagi" }, { "id": "1756", "label": "Lingasur" }, { "id": "1759", "label": "Lokapur" }, { "id": "1767", "label": "Mahalingpur" }, { "id": "1801", "label": "Maski" }, { "id": "1035", "label": "Mulki" }, { "id": "4035", "label": "Murdeshwar" }, { "id": "243", "label": "Nasik" }, { "id": "1959", "label": "Rabakavi" }, { "id": "1972", "label": "Ranebennur" }, { "id": "1984", "label": "Ron" }, { "id": "1985", "label": "Sagara" }, { "id": "1998", "label": "Sangali" }, { "id": "1323", "label": "Sankeshwar" }, { "id": "2016", "label": "Shahapur" }, { "id": "2026", "label": "Shimoga" }, { "id": "2035", "label": "Shriramnagar" }, { "id": "4042", "label": "Siddapur(KDR)" }, { "id": "2039", "label": "Sindagi" }, { "id": "2040", "label": "Sindhnur" }, { "id": "2046", "label": "Sirguppa" }, { "id": "2049", "label": "Sirsi" }, { "id": "4044", "label": "Sirwar" }, { "id": "3145", "label": "Sorab" }, { "id": "1207", "label": "Suratkal" }, { "id": "2100", "label": "Thirthahalli" }, { "id": "4045", "label": "Torangallu" }, { "id": "2203", "label": "Vita" }, { "id": "2214", "label": "Yellapur" }, { "id": "2660", "label": "Devarapalli" }, { "id": "835", "label": "Dharmavaram" }, { "id": "756", "label": "Kadodara" }, { "id": "4053", "label": "Madanapally" }, { "id": "4056", "label": "Nakirekal" }, { "id": "1927", "label": "Perambalur" }, { "id": "4060", "label": "Rly.koduru" }, { "id": "2096", "label": "Thanjavur" }, { "id": "876", "label": "Tirupur" }, { "id": "2201", "label": "Virudhunagar" }, { "id": "14", "label": "Vizag" }, { "id": "8", "label": "Sullurupeta" }, { "id": "31", "label": "Kathipudi" }, { "id": "84", "label": "Nellore (By-pass)" }, { "id": "1054", "label": "Tuni (By-Pass)" }, { "id": "412", "label": "Eluru (By-Pass)" }, { "id": "540", "label": "Nellore (Mini By-Pass)" }, { "id": "64", "label": "Khammam" }, { "id": "544", "label": "Bharatpur" }, { "id": "543", "label": "Sri Balaji" }, { "id": "545", "label": "Dausa" }, { "id": "115", "label": "Kavali (Bye Pass)" }, { "id": "657", "label": "Tirupathi By-Pass" }, { "id": "663", "label": "Sri Kalahasthi" }, { "id": "10", "label": "Guduru" }, { "id": "1235", "label": "Anantapur By-pass" }, { "id": "665", "label": "Tirupathi Balaji Darshan" }, { "id": "511", "label": "Addanki" }, { "id": "32", "label": "Ulavapadu" }, { "id": "449", "label": "Azamgarh" }, { "id": "508", "label": "Mau" }, { "id": "1055", "label": "Annavaram (By-Pass)" }, { "id": "464", "label": "Achanta" }, { "id": "263", "label": "Brahmana Cheruvu" }, { "id": "468", "label": "Rachuru" }, { "id": "483", "label": "Narayanpuram" }, { "id": "270", "label": "Nidamaru" }, { "id": "901", "label": "Kodamanchili" }, { "id": "902", "label": "Ardavaram" }, { "id": "1277", "label": "Penumantra" }, { "id": "1059", "label": "Sriguppa" }, { "id": "1063", "label": "Aluru" }, { "id": "2453", "label": "Kovvuru(Nellore Bypass)" }, { "id": "2254", "label": "S.Konda(Bye Pass)" }, { "id": "2099", "label": "Thindivanam" }, { "id": "1096", "label": "Miraj" }, { "id": "1099", "label": "Jaisingpur" }, { "id": "844", "label": "Nandaluru" }, { "id": "1186", "label": "City Tour" }, { "id": "1184", "label": "Shirdi(With Accomdation)" }, { "id": "247", "label": "Amaravathi" }, { "id": "153", "label": "Adilabad" }, { "id": "1187", "label": "Yavatmal" }, { "id": "304", "label": "Sivakodu" }, { "id": "494", "label": "Aswaraopet" }, { "id": "495", "label": "Sathupalli" }, { "id": "61", "label": "Tada" }, { "id": "1149", "label": "Shirur Ghodnadi" }, { "id": "1151", "label": "Nevasa Phata" }, { "id": "1150", "label": "Supa" }, { "id": "1143", "label": "Badnapur" }, { "id": "158", "label": "Omerga" }, { "id": "1276", "label": "Kesavaram" }, { "id": "1275", "label": "Vundhurru" }, { "id": "1274", "label": "Yendagandi" }, { "id": "1273", "label": "Garagaparru" }, { "id": "1272", "label": "Gollalakoderu" }, { "id": "1271", "label": "Palakoderu" }, { "id": "1270", "label": "Kumadhavalli" }, { "id": "1269", "label": "Chinna Ameeram" }, { "id": "1268", "label": "Pedha Ameeram" }, { "id": "135", "label": "Kallakuru" }, { "id": "466", "label": "Penumandra" }, { "id": "691", "label": "Lonavala" }, { "id": "778", "label": "Pimpalgaon" }, { "id": "1147", "label": "Nashirabad" }, { "id": "1148", "label": "Sakegaon" }, { "id": "248", "label": "Dhulia" }, { "id": "1241", "label": "Indapur" }, { "id": "781", "label": "Yedsi" }, { "id": "782", "label": "Shirur" }, { "id": "1239", "label": "Chakur" }, { "id": "783", "label": "Nalegaon" }, { "id": "1289", "label": "Koleru" }, { "id": "717", "label": "Vaijapur" }, { "id": "1293", "label": "Yanam Bridge" }, { "id": "1053", "label": "Rajamundry (By-Pass)" }, { "id": "353", "label": "Shajhanpur" }, { "id": "354", "label": "Sitapur" }, { "id": "2253", "label": "Tanguturu(Bye Pass)" }, { "id": "1328", "label": "Cochin\/Ernakulam" }, { "id": "1010", "label": "Coimbatore byepass" }, { "id": "100", "label": "Indore" }, { "id": "107", "label": "Nizamabad" }, { "id": "109", "label": "Hingoli" }, { "id": "110", "label": "Burhanpur" }, { "id": "139", "label": "Khamgoan" }, { "id": "141", "label": "Washim" }, { "id": "142", "label": "Khandwa" }, { "id": "1292", "label": "Bijapur" }, { "id": "2212", "label": "Yaragatti" }, { "id": "350", "label": "Muradabad" }, { "id": "366", "label": "Faizabad" }, { "id": "2307", "label": "Jonnada" }, { "id": "698", "label": "Chiplun" }, { "id": "701", "label": "Lanja" }, { "id": "830", "label": "Kharepatan" }, { "id": "831", "label": "Tarala" }, { "id": "1860", "label": "Nandgaon" }, { "id": "676", "label": "Kudal" }, { "id": "1084", "label": "Nallapadu" }, { "id": "2345", "label": "Shirdi Package" }, { "id": "420", "label": "Hapur" }, { "id": "359", "label": "Orai" }, { "id": "384", "label": "Meerut" }, { "id": "365", "label": "Bulandsahar" }, { "id": "2454", "label": "Raichur (Via Mantralaya)" }, { "id": "147", "label": "Tanuku(Bye-Pass)" }, { "id": "793", "label": "Uravakonda" }, { "id": "2480", "label": "Guntur Bye-Pass" }, { "id": "2481", "label": "Annavaram Bye-Pass" }, { "id": "2489", "label": "Viregaon" }, { "id": "2490", "label": "Waturphata" }, { "id": "2492", "label": "Zerophata" }, { "id": "1404", "label": "Basmat" }, { "id": "2494", "label": "Aategaon" }, { "id": "2495", "label": "Malegaon Nanded" }, { "id": "3948", "label": "Rajampet (By-Pass)" }, { "id": "378", "label": "Noida" }, { "id": "1319", "label": "Nagina" }, { "id": "720", "label": "Peth Naka" }, { "id": "682", "label": "Umarga" }, { "id": "710", "label": "Zahirabad" }, { "id": "1936", "label": "Pidugurala" }, { "id": "3593", "label": "Ibrahimpatnam" }, { "id": "3997", "label": "Ramvaramppadu Ring" }, { "id": "3998", "label": "Prasadampadu" }, { "id": "3999", "label": "Enkepadu" }, { "id": "4000", "label": "Atkuru" }, { "id": "4002", "label": "Nidamanuru" }, { "id": "4001", "label": "Telaprolu" }, { "id": "4051", "label": "Pannankulam" }, { "id": "1862", "label": "Nanguneri" }, { "id": "4016", "label": "Chennai(Madras)" }, { "id": "37", "label": "A.S.Peta" }, { "id": "160", "label": "Nirmal" }, { "id": "176", "label": "Ranchi" }, { "id": "186", "label": "Mayiladuthurai" }, { "id": "187", "label": "Thiruvarur" }, { "id": "193", "label": "Ammapattinam" }, { "id": "214", "label": "Cuttack" }, { "id": "218", "label": "Manamelkudi" }, { "id": "257", "label": "Kota" }, { "id": "298", "label": "Narasapuram" }, { "id": "355", "label": "Karamchedu" }, { "id": "394", "label": "Roorkee" }, { "id": "405", "label": "Rudrapur" }, { "id": "415", "label": "Rishikesh" }, { "id": "416", "label": "Bilaspur" }, { "id": "438", "label": "Katra" }, { "id": "492", "label": "Addavaram" }, { "id": "501", "label": "Erravaram" }, { "id": "537", "label": "Karlapalem" }, { "id": "652", "label": "Nallajarla" }, { "id": "679", "label": "Madgaon" }, { "id": "685", "label": "Dombivali" }, { "id": "686", "label": "Sangamner" }, { "id": "689", "label": "Nadiad" }, { "id": "690", "label": "Panvel" }, { "id": "696", "label": "Bagalkot" }, { "id": "703", "label": "Kankavali" }, { "id": "709", "label": "Aland" }, { "id": "752", "label": "Mumbai Darshan" }, { "id": "753", "label": "Navsari" }, { "id": "754", "label": "Vashi" }, { "id": "765", "label": "Karanja" }, { "id": "849", "label": "Kanchipuram" }, { "id": "887", "label": "Varagani" }, { "id": "888", "label": "Pedanandipadu" }, { "id": "889", "label": "Kommuru" }, { "id": "890", "label": "Kakumanu" }, { "id": "892", "label": "Returu" }, { "id": "893", "label": "Jammulapalem" }, { "id": "900", "label": "Singarayapalem" }, { "id": "930", "label": "Karukachal" }, { "id": "938", "label": "Kothamangalam" }, { "id": "945", "label": "Palarivattom" }, { "id": "952", "label": "Puthupally" }, { "id": "960", "label": "Thottekkad" }, { "id": "963", "label": "Vadakara" }, { "id": "983", "label": "Velankanni to Ernakulam" }, { "id": "987", "label": "Mannarkad" }, { "id": "988", "label": "Kallissery" }, { "id": "990", "label": "ambalapuzha" }, { "id": "992", "label": "Palapuram" }, { "id": "994", "label": "Shornur(kolapully)" }, { "id": "995", "label": "Kolapully(Shornur)" }, { "id": "998", "label": "Thriprayar" }, { "id": "1000", "label": "Chavakad" }, { "id": "1001", "label": "Koottanad(edapal road)" }, { "id": "1011", "label": "Ollur" }, { "id": "1012", "label": "Pollachi" }, { "id": "1015", "label": "Dindakal" }, { "id": "1019", "label": "kattappana (by pickup bus)" }, { "id": "1020", "label": "Thekkady" }, { "id": "1021", "label": "Mattancherry" }, { "id": "1022", "label": "Oddanchathiram" }, { "id": "1034", "label": "Surathkal" }, { "id": "1036", "label": "Padubidri" }, { "id": "1040", "label": "Kundapura" }, { "id": "1041", "label": "Baindur" }, { "id": "1043", "label": "Honavar" }, { "id": "1073", "label": "Yernagudem" }, { "id": "1077", "label": "Vyttila" }, { "id": "1078", "label": "Covai (Coimbatore)" }, { "id": "1085", "label": "Percherla" }, { "id": "1087", "label": "Kakani" }, { "id": "1110", "label": "Sagar" }, { "id": "1115", "label": "Guindy" }, { "id": "1135", "label": "Udaipur" }, { "id": "1190", "label": "Vuyyuru" }, { "id": "1226", "label": "Ajantha" }, { "id": "1231", "label": "Uppinangadi" }, { "id": "1303", "label": "Siruguppa" }, { "id": "1334", "label": "Aachara" }, { "id": "1353", "label": "Alur" }, { "id": "1365", "label": "Amritsar" }, { "id": "1367", "label": "Annur" }, { "id": "1373", "label": "Arumuganeri" }, { "id": "1375", "label": "Athani" }, { "id": "1379", "label": "Authoor" }, { "id": "1382", "label": "Ayyampet" }, { "id": "1386", "label": "Bagalkot (vidyagiri)" }, { "id": "1387", "label": "Bagdu" }, { "id": "1388", "label": "Bagodra" }, { "id": "1391", "label": "Bajpe" }, { "id": "1399", "label": "Bantwal" }, { "id": "1400", "label": "Bar" }, { "id": "1401", "label": "Bardoli" }, { "id": "1409", "label": "Bc Road" }, { "id": "1410", "label": "Beawer" }, { "id": "1412", "label": "Belman" }, { "id": "1414", "label": "Belur" }, { "id": "1415", "label": "Belvai" }, { "id": "1417", "label": "Bhachau" }, { "id": "1421", "label": "Bhalki" }, { "id": "1425", "label": "Bhavani" }, { "id": "1426", "label": "Bhavnagar" }, { "id": "1427", "label": "Bheshan" }, { "id": "1428", "label": "Bhilai" }, { "id": "1430", "label": "Bhilwara" }, { "id": "1431", "label": "Bhim" }, { "id": "1432", "label": "Bhinmal" }, { "id": "1435", "label": "Bhramavar" }, { "id": "1447", "label": "Bikaner" }, { "id": "1448", "label": "Bilagi" }, { "id": "1450", "label": "Bodi" }, { "id": "1452", "label": "Brahmavara" }, { "id": "1453", "label": "Byadagi" }, { "id": "1456", "label": "Canacona" }, { "id": "1459", "label": "Challakere" }, { "id": "1468", "label": "Chidambaram" }, { "id": "1473", "label": "Chingavanam" }, { "id": "1474", "label": "Chinnamanur" }, { "id": "1484", "label": "Cochin(kochi)" }, { "id": "1486", "label": "Coorg" }, { "id": "1514", "label": "Dharamshala" }, { "id": "1516", "label": "Dharmastala" }, { "id": "1536", "label": "Erattupetta" }, { "id": "1537", "label": "Erode Bypass" }, { "id": "1546", "label": "Gandhinagar" }, { "id": "1549", "label": "Gangolli" }, { "id": "1551", "label": "Gerusoppa" }, { "id": "1558", "label": "Gokarna Cross" }, { "id": "1561", "label": "Gopichettipalayam" }, { "id": "1571", "label": "Gurupura" }, { "id": "1578", "label": "Haliyal" }, { "id": "1586", "label": "Haveri" }, { "id": "1587", "label": "Hebri" }, { "id": "1591", "label": "Hiriyadka" }, { "id": "1596", "label": "Hosangadi" }, { "id": "1599", "label": "Hungund" }, { "id": "1606", "label": "Indi" }, { "id": "1607", "label": "Iritty" }, { "id": "1613", "label": "Jagityal" }, { "id": "1615", "label": "Jaisinghpur" }, { "id": "1623", "label": "Jamshedpur" }, { "id": "1632", "label": "Jindal" }, { "id": "1659", "label": "Kammarpally" }, { "id": "1662", "label": "Kandalur" }, { "id": "1669", "label": "Karad Byepass" }, { "id": "1673", "label": "Karumattampatti" }, { "id": "1678", "label": "Kateel" }, { "id": "1679", "label": "Katpadi" }, { "id": "1681", "label": "Kaup" }, { "id": "1683", "label": "Kayalpattinam" }, { "id": "1692", "label": "Keshod" }, { "id": "1693", "label": "Khambhalia" }, { "id": "1697", "label": "Kharghar" }, { "id": "1699", "label": "Khavdi" }, { "id": "1702", "label": "Kinnigoli" }, { "id": "1706", "label": "Kodaikanal" }, { "id": "1713", "label": "Kollur (mookambika)" }, { "id": "1716", "label": "Konaje" }, { "id": "1717", "label": "Konni" }, { "id": "1725", "label": "Kothara" }, { "id": "1732", "label": "Kudithini" }, { "id": "1734", "label": "Kulasekaram" }, { "id": "1736", "label": "Kullu" }, { "id": "1738", "label": "Kumbanad" }, { "id": "1739", "label": "Kumbhashi" }, { "id": "1743", "label": "Kunwariya" }, { "id": "1746", "label": "Kushalnagar" }, { "id": "1750", "label": "Kuttanad" }, { "id": "1751", "label": "Kuttippuram" }, { "id": "1753", "label": "Lakshmankudi" }, { "id": "1758", "label": "Lingsugur" }, { "id": "1761", "label": "Mabukala" }, { "id": "1762", "label": "Madathukulam" }, { "id": "1765", "label": "Madikeri" }, { "id": "1768", "label": "Mahe" }, { "id": "1775", "label": "Mallapur" }, { "id": "1779", "label": "Manchakal" }, { "id": "1783", "label": "Mandsaur" }, { "id": "1798", "label": "Marayur" }, { "id": "1802", "label": "Masthikatte" }, { "id": "1806", "label": "Mavinagundi" }, { "id": "1812", "label": "Metpally" }, { "id": "1815", "label": "Mijar"}];
$(function () {
    $(".auto").autocomplete({
        source: function (req, response) {
            var re = $.ui.autocomplete.escapeRegex(req.term);
            var matcher = new RegExp("^" + re, "i");
            response($.grep(stationslist, function (item) {
                $('.auto_id').val('0');
                return matcher.test(item.label);
            }));
        },
        selectFirst: true,
        minLength: 1,
        select: function (event, ui) {
            document.getElementById('HiddenSource').value = ui.item.value;
            document.getElementById('HiddenSourceID').value = ui.item.id;
            $('.auto_id').val(ui.item.id);
        }
    })
});

$(function () {
    $(".Dest").autocomplete({
        source: function (req, response) {
            var re = $.ui.autocomplete.escapeRegex(req.term);
            var matcher = new RegExp("^" + re, "i");
            response($.grep(stationslist, function (item) {
                $('.Dest_id').val('0');
                return matcher.test(item.label);
            }));
        },
        selectFirst: true,
        minLength: 1,
        select: function (event, ui) {
            document.getElementById('HiddenDestination').value = ui.item.value;
            document.getElementById('HiddenDestinationID').value = ui.item.id;
            $('.Dest_id').val(ui.item.id);
            //     $("#datepicker").focus();
        }
    })
});

function Validating() {
    var Destination = document.getElementById('txtDestination').value;
    document.getElementById('HiddenDestination').value = Destination;
    var Journydate = document.getElementById('datepicker').value;
    document.getElementById('HiddenDate').value = Journydate;
    var Source = document.getElementById('txtSource').value;
    document.getElementById('HiddenSource').value = Source;
    if (Source == "") {
        alert("Please enter valid From city");
        return false;
    }
    if (Destination == "") {
        alert("Please enter valid To city");
        return false;
    }
    if (Journydate == "") {
        alert("Please select Journy Date");
        return false;
    }
    if (Source == Destination) {
        alert("Please select another city");
        return false;
    }

    location.hash = "BusDetails/" + document.getElementById('HiddenSource').value + "/" + document.getElementById('HiddenDestination').value + "/" + document.getElementById('HiddenDate').value;

    // fillgrid();
    //            window.location.href = "SearchGrid.aspx?Source=" + Source + "&From=" + document.getElementById('HiddenSourceID').value + "&Destnation=" + Destination + "&To=" + document.getElementById('HiddenDestinationID').value + "&jdate=" + Journydate;

}

$(function () {
    $("#datetimepkr").datepicker({ dateFormat: 'yy-mm-dd', numberOfMonths: 2, showButtonPanel: false, minDate: +0, maxDate: '+13M +0D',
        onSelect: function (selectedDate) {
        }
    });
    $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd', numberOfMonths: 2, showButtonPanel: false, minDate: +0, maxDate: '+13M +0D',
        onSelect: function (selectedDate) {
        }
    });
});


function validateOnlyCharcters(e) {
    var keyValue = 0;
    if (!e) var e = window.event;
    if (!e.which) keyValue = e.keyCode;
    else keyValue = e.which;
    if ((keyValue != 27)) {
        if ((keyValue >= 65) && (keyValue <= 90) || (keyValue >= 97) && (keyValue <= 122) || keyValue == 8 || keyValue == 9 || keyValue == 32) {
            return true;
        } else {
            keyValue = 0;
            return false;
        }
    }
    return false;
}

var fromcontinuebtn = false;
var sourceid = "0";
var destinationid = "0";
var date = "";
var source = "";
var Destination = "";
function fillgrid() {
    if (window.location.hash) {
        var hash = window.location.hash.substring(1).toString(); //Puts hash in variable, and removes the # character
        var hashsplit = hash.split("/");
        if (hashsplit.length > 1) {
            if (hashsplit[0] == "BusDetails") {
                if (hashsplit.length == 4) {
                    $('#HiddenSource').val(hashsplit[1]);
                    $('#HiddenDestination').val(hashsplit[2]);
                    //  $('#HiddenDestinationID').val(hashsplit[4]);
                    $('#HiddenDate').val(hashsplit[3]);

                    $('#txtSource').val(hashsplit[1]);
                    $('#txtDestination').val(hashsplit[2]);
                    $('#datepicker').val(hashsplit[3]);
                    source = hashsplit[1];
                    //sourceid = hashsplit[2];
                    Destination = hashsplit[2];
                    // destinationid = hashsplit[4];
                    date = hashsplit[3];

                    $('#hdnfromto').val(hashsplit[1] + " to " + hashsplit[2]);
                    $('#lblFromTo').html(hashsplit[1] + " to " + hashsplit[2] + " on " + hashsplit[3] + "|")

                    $('#divmodifysearch').css('display', 'block');
                    var data = { 'op': 'search', 'src': hashsplit[1], 'dest': hashsplit[2], 'doj': hashsplit[3] };
                    //  var data = { 'sourceid': hashsplit[2], 'destinationid': hashsplit[4], 'jdate': hashsplit[5] };
                    var s = function (msg) {
                        if (msg) {
                            BindResults(msg);
                            setsoldout();
                            viewseatsfn();
                            sortables_init();
                        }
                    };
                    var e = function (x, h, e) {
                        // $('#BookingDetails').html(x);
//                        alert(x);
                    };
                    callHandler(data, s, e);



                }
            }
            else if (hashsplit[0] == "PassDetails") {
                if (fromcontinuebtn == true) {
                    fromcontinuebtn = false;
                }
                else {
                    document.location = "Default.aspx";
                }
            }
        }
        // hash found
    } else {
        // No hash found
        document.location = "Default.aspx";
    }

}

function searchresultHandler(d, s, e) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "DatawebService.asmx/ShowCancpolicy",
        data: d,

        dataType: "json",
        success: s,
        error: e
    });
}

function callHandler(d, s, e) {
    $.ajax({
        url: 'Bus.axd',
        data: d,
        type: 'GET',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        async: true,
        cache: true,
        success: s,
        error: e
    });
}

function setsoldout() {
    $('.viewSeats').each(function () {
        var seats = $(this).closest('tr').find('.remainingseats');
        var sts = seats.html();
        if (sts == "0 ") {
            $(this).addClass('soldoutclass');
            $(this).attr("disabled", "disabled");
            $(this).val("Sold Out");
        }
    });

}

var loaded = false;
function BindResults(data) {
    if (data.length > 0) {
        $('#divoops').css('display', 'none');
        $('#BookingDetails').css('display', 'block');

        $('#BookingDetails').setTemplateURL('SearchResult.htm');
        $('#BookingDetails').processTemplate(data);
        if (loaded == false) {
            theadcall();
            loaded = true;
        }
    }
    else {
        $('#BookingDetails').css('display', 'none');
        $('#divoops').css('display', 'block');
    }
}


var shownlayout = null;
var SeatFare = 0;
// var SeatFare = 0;
var ServiceID = 0;
var Service_Type = "";
var Travel_Name = "";
var Boarding_ID = 0;
var BoardingPoint = 0;
var BoardingDesc = 0;
var Btime = 0;
var lblSelectedSeatNo = "";
sourceid = "";
destinationid = "";
var TotalFare = 0;
var OriginID = 0;
// var destinationID = 0;
var RservationID = 0;
var Api = "";
var fare = 0;
function viewseatsfn() {
    $('.viewSeats').click(function () {
        var nTr = $(this).closest("tr");
        var justaddedrow = $(this).closest("table").find("#addedrow");
        if (justaddedrow != null)
            justaddedrow.remove();
        var oTable = document.getElementById('SortingTable');
        var row = '<tr id="addedrow"><td id="buslayouttd"  colspan="7" style="border-bottom:1px solid #C0C0C0;">';
        row += '<div id="buslayoutshow" class="seatlayout"></div>';
        row += '</td></tr>';
        $(row).insertAfter(nTr);


        var ServiceType = $(this).next();
        var TravelName = ServiceType.next();
        var ser_id = TravelName.next();
        var apival = ser_id.next();
        Api = apival.val();
        var Sfare = apival.next();
        fare = Sfare.val();
        // alert(api);
        //  alert(ser_id.val() + "  " + (TravelName.val()) + "  " + (ServiceType.val()) + "  ");
        //            var divlayoutshower = $(div_s_layout).next().next();
        //  alert("hii");

        var divlayoutshower = $(this).closest("tr").next().find("div.seatlayout");
        ServiceID = ser_id.val();
        Service_Type = ServiceType.val();
        Travel_Name = TravelName.val();

        sourceid = document.getElementById('HiddenSourceID').value;
        destinationid = document.getElementById('HiddenDestinationID').value;
        var date = document.getElementById('HiddenDate').value;
        var data = { 'op': 'GetSeatLayout', 'src': source, 'dest': Destination, 'doj': date, 'ser_id': ServiceID, 'api': Api, 'fare': fare };
        var s = function (msg) {
            if (msg) {
                Bindlayout(msg, divlayoutshower);
                var serlayt = "";
                $.each(msg, function (index, value) {
                    if (shownlayout) {
                        shownlayout.closest('tr').find('#buslayouttd').css('border-top', '0px solid #FFFFFF').css('background-color', '');
                        shownlayout.css('display', 'none');
                    }
                    divlayoutshower.css('display', 'block');
                    divlayoutshower.closest('tr').find('#buslayouttd').css('border-top', '1px solid #C0C0C0').css('background-color', '#FDFDF2');
                    var dropval = value['brdingpoints']
                    drawLayout(value['Ser_Layout_type'], value['capacity'], value['seatfare'], value['berthfare'], value['SeatsLayout'], value['upperBerthLayout'], value['LowerBerthLayout'], value['Booked_sb'], divlayoutshower);
                    var ddllll = divlayoutshower.find('#ddlBoardingPoints');
                    SeatFare = value['seatfare'];

                    BerthFare = value['berthfare'];
                    OriginID = value['originID'];
                    destinatnID = value['destinatiomID'];
                    RservationID = value['ReservationID'];
                    shownlayout = divlayoutshower;
                    $('.lbldescription').html("");
                    $('.descclass').css("background", "").css("border-bottom", "").css("border-top", "").css("background-color", "");
                    $.each(dropval, function (key, val) {
                        ddllll.append($("<option></option>").attr("value", val).text(key));
                    });
                });
            }
        };
        var e = function (x, h, e) {
            $('#BookingDetails').html(e);
        };
        $(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
        callHandler(data, s, e);

    }
        );
}
function ContinueClick() {
    fromcontinuebtn = true;
    var Seats = shownlayout.find('#lblSelectedSeatNo').html();
    if (Seats == 0) {
        alert("Please Select Seats");
        return false;
    }
    var ddlBoardingPoints = shownlayout.find('#ddlBoardingPoints').val();
    if (ddlBoardingPoints == 0) {
        alert("Select Boarding Point");
        return false;
    }
    SeatFare = shownlayout.find('#lblAmount').html();
    TotalFare = shownlayout.find('#OrgAmount').html();
    lblSelectedSeatNo = shownlayout.find('#lblSelectedSeatNo').html();
    var selectedseats = new Array();
    selectedseats = lblSelectedSeatNo.split(",");
    var lblAmount = shownlayout.find('#lblAmount').html();
    var LadiesSeat = shownlayout.find('#lblLadiesSeat').html();
    var ladiesseats = new Array();
    ladiesseats = LadiesSeat.split(",");
    var data = new Array();
    var gender = "";
    for (var i = 0; i < selectedseats.length; i++) {
        for (var j = 0; j < ladiesseats.length; j++) {
            if (ladiesseats[j] == selectedseats[i]) {
                gender = "Female";
                break;
            }
            else {
                gender = "Male";
                //                        break;
            }
        }
        data.push({ selectedseats: selectedseats[i], Gender: gender });
    }
    $('#divmodifysearch').css('display', 'none');
    $('#BookingDetails').removeTemplate();
    $("#BookingDetails").setTemplateURL('Bookingdetails.htm');
    $("#BookingDetails").processTemplate(data);
    var source = document.getElementById('HiddenSource').value;
    var destination = document.getElementById('HiddenDestination').value;
    var date = document.getElementById('HiddenDate').value;
    document.getElementById('lblSource').innerHTML = source;
    document.getElementById('lblDestination').innerHTML = destination;
    document.getElementById('lblDate').innerHTML = date;
    document.getElementById('lblTravelsName').innerHTML = Travel_Name;
    document.getElementById('lblBusType').innerHTML = Service_Type;
    document.getElementById('lblBoardingPoint').innerHTML = BoardingPoint;
    document.getElementById('lblSelectedSeatNos').innerHTML = lblSelectedSeatNo;
    document.getElementById('lblamt').innerHTML = TotalFare;
    document.getElementById('lblyourfare').innerHTML = SeatFare;
    document.getElementById('lblbustopdiscount').innerHTML = (TotalFare.split('.')[1]) - (SeatFare.split('.')[1]);
    location.hash = "PassDetails/" + document.getElementById('HiddenSource').value + "/" + document.getElementById('HiddenSourceID').value + "/" + document.getElementById('HiddenDestination').value + "/" + document.getElementById('HiddenDestinationID').value + "/" + document.getElementById('HiddenDate').value;
}

function Bindlayout(data, layoutpnl) {
    layoutpnl.setTemplateURL('BusLayout.htm');
    layoutpnl.processTemplate(data);
}
function ShowCancpolicy(travelid, api, serviceid, travels) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "SearchGrid.aspx/ShowCancpolicy",
        data: "{'travelid':'" + travelid + "','api':'" + api + "','serviceid':'" + serviceid + "','travels':'" + travels + "'}",

        dataType: "json",
        success: function (data) {

            Cancellationpolicy(data.d);
            // alert(data.d);
        },
        error: function (result) {
        }
    });
}
function Gotopayment() {

    var valid = true;
    $('.psgrtextclick').each(function (i, obj) {
        if ($(this).val() == "") {
            $(this).next().css('display', 'block');
            valid = false;
        }
        else {
            $(this).next().css('display', 'none');
        }
    });
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if ($('#txtpassname').val() == "") {
        $(this).next().css('display', 'block');
        valid = false;
    }
    else {
    }
    if ($('#txtpassname').val() == "") {
        $('#txtpassname').next().css('display', 'block');
        valid = false;
    } else {
        $('#txtpassname').next().css('display', 'none');
    }
    if ($('#txtmobno').val().length != 10) {
        $('#txtmobno').next().css('display', 'block');
        valid = false;
    } else {
        $('#txtmobno').next().css('display', 'none');
    }
    if (!reg.test($('#txtemailid').val())) {
        $('#txtemailid').next().css('display', 'block');
        valid = false;
    } else {
        $('#txtemailid').next().css('display', 'none');
    }
    if ($('#txtaddress').val() == "") {
        $('#txtaddress').next().css('display', 'block');
        valid = false;
    } else {
        $('#txtaddress').next().css('display', 'none');
    }
    if ($('#chkAgree').is(':checked')) {
        $('#chkAgree').next().next().css('display', 'none');
    } else {
        $('#chkAgree').next().next().css('display', 'block');
        valid = false;
    }
    if (!valid) {
        return false;
    }
    lblSelectedSeatNo = shownlayout.find('#lblSelectedSeatNo').html();
    var Amount = shownlayout.find('#lblAmount').html(); // document.getElementById('lblAmount').innerHTML;
    var lblAmount = Amount.split('.')[1];
    var LadiesSeat = shownlayout.find('#lblLadiesSeat').html();
    var passengerdetails = new Array();
    var rows = $("#tabledetails tr:gt(0)"); // skip the header row
    $(rows).each(function (i, obj) {
        passengerdetails.push({ Name: $(this).find('#txtName').val(), Gender: $(this).find('#rblGender').val(), Age: $(this).find('#txtAge').val(), Seatno: $(this).find('#txtseatno').val() });
    });
    var name = "";
    var gender = "";
    var age = "";
    var seatnos = "";
    for (var a = 1; a < passengerdetails.length; a++) {
        name += passengerdetails[a]['Name'] + ",";
        gender += passengerdetails[a]['Gender'] + ",";
        age += passengerdetails[a]['Age'] + ",";
        seatnos += passengerdetails[a]['Seatno'] + ",";
    }
    name = name.slice(0, name.length - 1);
    gender = gender.slice(0, gender.length - 1);
    age = age.slice(0, age.length - 1);
    seatnos = seatnos.slice(0, seatnos.length - 1);


    var PassName = document.getElementById('txtpassname').value;
    var MobNo = document.getElementById('txtmobno').value;
    var Address = document.getElementById('txtaddress').value;
    var EmailID = document.getElementById('txtemailid').value;
    var data = { 'op': 'Bookingdetails', 'SeatFare': SeatFare, 'TotalAmount': lblAmount, 'OriginID': OriginID, 'destinatnID': destinatnID, 'RservationID': RservationID, 'BerthFare': BerthFare, 'Selectedseats': lblSelectedSeatNo, 'Travelname': Travel_Name, 'Source': source, 'SourceID': sourceid, 'DestinationID': destinationid, 'Destination': Destination, 'Dateofjourney': date, 'Servicetype': Service_Type, 'ServiceID': ServiceID, 'BoardindID': Boarding_ID, 'Boardindpoint': BoardingPoint, 'Description': BoardingDesc, 'LadiesSeat': LadiesSeat, 'CustName': PassName, 'CustMobNo': MobNo, 'CustAddress': Address, 'custEmailID': EmailID, 'Pname': name, 'Pgender': gender, 'PAge': age, 'PSeatno': seatnos, 'Btime': Btime, 'api': Api };
    var s = function (msg) {
        if (msg) {
            window.location.href = msg["responseurl"];
        }
    };
    var e = function (x, h, e) {
//        alert(x);
        window.location = "OppsPage.aspx";

    };
    callHandler(data, s, e);

    // window.location.href = "test.aspx";
}

function fixgender(myself, data) {
    if (data == "Female") {
        $(myself).css('disabled', 'disabled');
    }
    else {
        alert(data);
    }

}

function ddlBPselectionchanged(val, txt) {
    if (val != 0) {
        $('.lbldescription').html(val.split('#')[0]);
        BoardingDesc = val.split('#')[0];
        BoardingPoint = txt;
        var time = txt.split(/[\s-]+/);
        var SplitTime = time[time.length - 1]
        Btime = SplitTime
        Boarding_ID = val.split('#')[1];
        $('.descclass').css("border-bottom", " 1px solid #d6d6d6").css("border-top", " 1px solid #d6d6d6").css("background-color", "#FFFFFC").css("text-align", "left");
        $('.lbldescription').next().val(val + ',' + txt.split('-')[0] + ',' + document.getElementById('txtSource').value);
    }
    else {
        $('.lbldescription').html("");
        $('.lbldescription').next().val("");
        $('.descclass').css("background", "").css("border-bottom", "").css("border-top", "").css("background-color", "");
    }
}


function theadcall() {
    $('thead th').click(function () {
        var oTable = document.getElementById('SortingTable');
        var justaddedrow = $(oTable).find("#addedrow");
        if (justaddedrow != null) {
            justaddedrow.remove();
        }
    });
}

function Cancellationpolicy(cancelpolicy) {
    if (cancelpolicy.length > 0) {
        var cancel = cancelpolicy.split('$');
        if (cancel.length > 0) {
            var hourssplit = cancel[1].split(',');
            var percentsplit = cancel[2].split(',');
            var frameword = "";
            var timeGap = "";
            var count = 0;
            for (var i = hourssplit.length; i >= 0; i--) {
                if (hourssplit[i] != undefined) {
                    if (hourssplit[i] != "") {
                        if (i == 0) {
                            if (count == 0) {

                                frameword += "before " + hourssplit[i] + " hrs ";
                                timeGap += +percentsplit[i] + '%\n';
                                frameword += "<br/>";
                                frameword += "<br/>";
                                timeGap += "<br/>";
                                timeGap += "<br/>";

                            }
                            else {
                                frameword += "B/W " + hourssplit[i + 1] + " hrs and " + hourssplit[i] + "hrs ";
                                timeGap += +percentsplit[i] + '%\n';
                                frameword += "<br/>";
                                frameword += "<br/>";
                                timeGap += "<br/>";
                                timeGap += "<br/>";
                            }
                        }
                        else {
                            if (frameword != "") {

                                frameword += "B/W " + hourssplit[i] + " hrs and " + hourssplit[i - 1] + "hrs ";
                                timeGap += +percentsplit[i] + '%\n';
                                frameword += "<br/>";
                                frameword += "<br/>";
                                timeGap += "<br/>";
                                timeGap += "<br/>";
                            }
                            else {
                                frameword += "above " + hourssplit[i] + " hrs ";
                                timeGap += +percentsplit[i] + '%\n'; // alert(i+ " is "+"above " + hourssplit[i] + " " + percentsplit[i] + "%");
                                frameword += "<br/>";
                                frameword += "<br/>";
                                timeGap += "<br/>";
                                timeGap += "<br/>";
                            }
                        }
                        count++;
                    }
                }
            }
            $('#cancfromto').html(document.getElementById('hdnfromto').value);
            $('#canctravels').html(cancel[0]);
        }
        var divheight = (count * 30) + 100;

        var discancdiv = $('#DisCancdiv');
        discancdiv.css({ 'top': '0px', 'position': 'Fixed' });
        var divcancheight = $('.divcancel');
        divcancheight.css({ 'height': divheight });
        discancdiv.slideDown("fast");
        $('#Canpolitext').html(frameword);
        $('#canTime').html(timeGap);
        //            for(int i=0;cancel.length
    }
}


function numberOnlyExample() {
    if ((event.keyCode < 48) || (event.keyCode > 57))
        return false;
}
function SeatsBlocking() {
    alert("Sorry for trouble., Selected seats are already booked");
    return false;
}


function termsclick() {
    $('#termsform').css({ 'top': '0px', 'position': 'Fixed', 'display': 'block' });
    $('#termsform').slideDown('fast');
}
var termsdisplay = true;
function termsstaticdivclick(e) {
    $('#termsform').css({ 'top': '0px', 'position': 'Fixed', 'display': 'block' });
    $('#termsform').css('display', 'block');
    termsdisplay = false;
}
function termsdivclick() {
    if (termsdisplay)
        $('#termsform').css('display', 'none');
    else
        termsdisplay = true;
}



function txtfocusout() {
    var textstatus = false;
    $('.psgrtextclick').each(function (i, obj) {
        if ($(this).val() != "") {
            textstatus = true;
        }
        else {
            textstatus = false;
            return false;
        }
    });
    if (textstatus) {
        $('#orangeblt').css('display', 'block');
        $('#whiteblt').css('display', 'none');
    }
    else {
        $('#orangeblt').css('display', 'none');
        $('#whiteblt').css('display', 'block');
    }
}

function cntctfocusout() {
    var pname = $('#txtpassname').val();
    var mobno = $('#txtmobno').val();
    var email = $('#txtemailid').val();
    var address = $('#txtaddress').val();
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (pname != "") {
        if (mobno.length == 10) {
            if (reg.test(email)) {
                if (address != "") {
                    $('#cntctbltorange').css('display', 'block');
                    $('#cntctbltwhite').css('display', 'none');
                }
                else {
                    $('#cntctbltorange').css('display', 'none');
                    $('#cntctbltwhite').css('display', 'block');
                }
            } else {
                $('#cntctbltorange').css('display', 'none');
                $('#cntctbltwhite').css('display', 'block');
            }
        } else {
            $('#cntctbltorange').css('display', 'none');
            $('#cntctbltwhite').css('display', 'block');
        }
    } else {
        $('#cntctbltorange').css('display', 'none');
        $('#cntctbltwhite').css('display', 'block');
    }
}
//.......boardingpoint mouseohover..........//
function bphover(me, points) {
    var valu = $('#displaydiv');
    $('#displaydiv').css("display", "block");
    var pos = $(me).offset();
    $("#displaydiv").html(points);

    var top = $(document).scrollTop();
    var tothei = $(document).height();
    var xx = window.screen.availHeight;

    if ((top + xx) >= (pos.top + $('#displaydiv').height() + ($('#displaydiv').height() * .5))) {
        $('#displaydiv').css("top", pos.top).css("left", pos.left + 80);
    }
    else {
        if ((pos.top - $('#displaydiv').height()) < 0) {
            //alert("here" + (pos.top - $('#displaydiv').height()));
            $('#displaydiv').css("top", "0").css("left", pos.left + 80);
        }
        else {
            //alert("there" + (pos.top - $('#displaydiv').height()));
            $('#displaydiv').css("top", pos.top - $('#displaydiv').height()).css("left", pos.left + 80);
        }
    }
}

function bpmouseout() {
    $("#displaydiv").css("display", "none"); $("#displaydiv").html("");
}
      
   