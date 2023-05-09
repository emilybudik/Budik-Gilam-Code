#data frame
Anagram_Table <- data.frame( Anagram = c("מגואל", "נוגד דם", "מיטהאב", "צייתמלים", "כיות", "פרסתות", "מפיקמשי", "עלימת", "מצד", "טנדראה"),
                             Word = c("אלמוג", "מגן דוד", "אמבטיה", "מצילתיים", "כיות", "תספורת", "משקפיים", "מעלית", "צמד", "אנדרטה"),
                             Translation = c("Coral", "Star of David", "Bath tub", "Cymbals", "Parrot", "Haircut", "Glasses", "Elevator", "Pair", "Monument"),
                             Difficulty = c("Hard", "Hard", "Hard", "Medium", "Medium", "Medium", "Medium", "Medium", "Easy", "Easy"))

print(Anagram_Table)
print(Anagram_Table, row.names = F)

