
# All Emoji returned by Emoji Module

The emoji module is mentioned in the [dumb or fun](/dumb_or_fun_ideas.md) article.

Here's a list of all the emoji it returns, and their names, including attributes about each emoji.


<!-- 
$json = Get-Content 'C:\Users\Leon\Documents\WindowsPowerShell\Modules\Emojis\0.1\Unicode-Emojis.json' | Out-String | ConvertFrom-Json
$json | % { "|" + (get-emoji -Name $_.Name) + "|" + $_.Name + "|" + $_.Code + "|" + (($_.code -replace "U[+]", "&#") -replace " ",";") + ";|" + $_.Annotations + "|" } | set-clipboard
-->


|Emoji|Name|Unicode|HTML Entity Code|Attributes|
|-----|----|-------|----------------|----------|
|😀|GRINNING FACE|U+1F600|&#1F600;|face, grin, person|
|😁|GRINNING FACE WITH SMILING EYES|U+1F601|&#1F601;|eye, face, grin, person, smile|
|😂|FACE WITH TEARS OF JOY|U+1F602|&#1F602;|face, joy, laugh, person, tear|
|😃|SMILING FACE WITH OPEN MOUTH|U+1F603|&#1F603;|face, mouth, open, person, smile|
|😄|SMILING FACE WITH OPEN MOUTH AND SMILING EYES|U+1F604|&#1F604;|eye, face, mouth, open, person, smile|
|😅|SMILING FACE WITH OPEN MOUTH AND COLD SWEAT|U+1F605|&#1F605;|cold, face, open, person, smile, sweat|
|😆|SMILING FACE WITH OPEN MOUTH AND TIGHTLY-CLOSED EYES|U+1F606|&#1F606;|face, laugh, mouth, open, person, satisfied, smile|
|😉|WINKING FACE|U+1F609|&#1F609;|face, person, wink|
|😊|SMILING FACE WITH SMILING EYES|U+1F60A|&#1F60A;|blush, eye, face, person, smile|
|😋|FACE SAVOURING DELICIOUS FOOD|U+1F60B|&#1F60B;|delicious, face, food, person, savouring, smile, um, yum|
|😎|SMILING FACE WITH SUNGLASSES|U+1F60E|&#1F60E;|bright, cool, eye, eyewear, face, glasses, person, smile, sun, sunglasses, weather|
|😍|SMILING FACE WITH HEART-SHAPED EYES|U+1F60D|&#1F60D;|eye, face, heart, love, person, smile|
|😘|FACE THROWING A KISS|U+1F618|&#1F618;|face, heart, kiss, person|
|😗|KISSING FACE|U+1F617|&#1F617;|face, kiss, person|
|😙|KISSING FACE WITH SMILING EYES|U+1F619|&#1F619;|eye, face, kiss, person, smile|
|😚|KISSING FACE WITH CLOSED EYES|U+1F61A|&#1F61A;|closed, eye, face, kiss, person|
|☺|WHITE SMILING FACE|U+263A|&#263A;|face, outlined, person, relaxed, smile|
|🙂|SLIGHTLY SMILING FACE|U+1F642|&#1F642;|face, person, smile|
|🤗|HUGGING FACE|U+1F917|&#1F917;|face, hug, hugging, person|
|😇|SMILING FACE WITH HALO|U+1F607|&#1F607;|angel, face, fairy tale, fantasy, halo, innocent, person, smile|
|🤓|NERD FACE|U+1F913|&#1F913;|face, geek, nerd, person|
|🤔|THINKING FACE|U+1F914|&#1F914;|face, person, thinking|
|😐|NEUTRAL FACE|U+1F610|&#1F610;|deadpan, face, neutral, person|
|😑|EXPRESSIONLESS FACE|U+1F611|&#1F611;|expressionless, face, inexpressive, person, unexpressive|
|😶|FACE WITHOUT MOUTH|U+1F636|&#1F636;|face, mouth, person, quiet, silent|
|🙄|FACE WITH ROLLING EYES|U+1F644|&#1F644;|eyes, face, person, rolling|
|😏|SMIRKING FACE|U+1F60F|&#1F60F;|face, person, smirk|
|😣|PERSEVERING FACE|U+1F623|&#1F623;|face, persevere, person|
|😥|DISAPPOINTED BUT RELIEVED FACE|U+1F625|&#1F625;|disappointed, face, person, relieved, whew|
|😮|FACE WITH OPEN MOUTH|U+1F62E|&#1F62E;|face, mouth, open, person, sympathy|
|🤐|ZIPPER-MOUTH FACE|U+1F910|&#1F910;|face, mouth, person, zipper|
|😯|HUSHED FACE|U+1F62F|&#1F62F;|face, hushed, person, stunned, surprised|
|😪|SLEEPY FACE|U+1F62A|&#1F62A;|face, person, sleep|
|😫|TIRED FACE|U+1F62B|&#1F62B;|face, person, tired|
|😴|SLEEPING FACE|U+1F634|&#1F634;|face, person, sleep, zzz|
|😌|RELIEVED FACE|U+1F60C|&#1F60C;|face, person, relieved|
|😛|FACE WITH STUCK-OUT TONGUE|U+1F61B|&#1F61B;|face, person, tongue|
|😜|FACE WITH STUCK-OUT TONGUE AND WINKING EYE|U+1F61C|&#1F61C;|eye, face, joke, person, tongue, wink|
|😝|FACE WITH STUCK-OUT TONGUE AND TIGHTLY-CLOSED EYES|U+1F61D|&#1F61D;|eye, face, horrible, person, taste, tongue|
|😒|UNAMUSED FACE|U+1F612|&#1F612;|face, person, unamused, unhappy|
|😓|FACE WITH COLD SWEAT|U+1F613|&#1F613;|cold, face, person, sweat|
|😔|PENSIVE FACE|U+1F614|&#1F614;|dejected, face, pensive, person|
|😕|CONFUSED FACE|U+1F615|&#1F615;|confused, face, person|
|🙃|UPSIDE-DOWN FACE|U+1F643|&#1F643;|face, person, upside-down|
|🤑|MONEY-MOUTH FACE|U+1F911|&#1F911;|face, money, mouth, person|
|😲|ASTONISHED FACE|U+1F632|&#1F632;|astonished, face, person, shocked, totally|
|😷|FACE WITH MEDICAL MASK|U+1F637|&#1F637;|cold, doctor, face, mask, medicine, person, sick|
|🤒|FACE WITH THERMOMETER|U+1F912|&#1F912;|face, ill, person, sick, thermometer|
|🤕|FACE WITH HEAD-BANDAGE|U+1F915|&#1F915;|bandage, face, hurt, injury, person|
|☹|WHITE FROWNING FACE|U+2639|&#2639;|face, frown, person|
|🙁|SLIGHTLY FROWNING FACE|U+1F641|&#1F641;|face, frown, person|
|😖|CONFOUNDED FACE|U+1F616|&#1F616;|confounded, face, person|
|😞|DISAPPOINTED FACE|U+1F61E|&#1F61E;|disappointed, face, person|
|😟|WORRIED FACE|U+1F61F|&#1F61F;|face, person, worried|
|😤|FACE WITH LOOK OF TRIUMPH|U+1F624|&#1F624;|face, person, triumph, won|
|😢|CRYING FACE|U+1F622|&#1F622;|cry, face, person, sad, tear|
|😭|LOUDLY CRYING FACE|U+1F62D|&#1F62D;|cry, face, person, sad, sob, tear|
|😦|FROWNING FACE WITH OPEN MOUTH|U+1F626|&#1F626;|face, frown, mouth, open, person|
|😧|ANGUISHED FACE|U+1F627|&#1F627;|anguished, face, person|
|😨|FEARFUL FACE|U+1F628|&#1F628;|face, fear, fearful, person, scared|
|😩|WEARY FACE|U+1F629|&#1F629;|face, person, tired, weary|
|😬|GRIMACING FACE|U+1F62C|&#1F62C;|face, grimace, person|
|😰|FACE WITH OPEN MOUTH AND COLD SWEAT|U+1F630|&#1F630;|blue, cold, face, mouth, open, person, rushed, sweat|
|😱|FACE SCREAMING IN FEAR|U+1F631|&#1F631;|face, fear, fearful, munch, person, scared, scream|
|😳|FLUSHED FACE|U+1F633|&#1F633;|dazed, face, flushed, person|
|😵|DIZZY FACE|U+1F635|&#1F635;|dizzy, face, person|
|😡|POUTING FACE|U+1F621|&#1F621;|angry, face, mad, person, pouting, rage, red|
|😠|ANGRY FACE|U+1F620|&#1F620;|angry, face, mad, person|
|😈|SMILING FACE WITH HORNS|U+1F608|&#1F608;|face, fairy tale, fantasy, horns, person, smile|
|👿|IMP|U+1F47F|&#1F47F;|demon, devil, face, fairy tale, fantasy, imp, person|
|👹|JAPANESE OGRE|U+1F479|&#1F479;|creature, face, fairy tale, fantasy, japanese, monster, ogre, person|
|👺|JAPANESE GOBLIN|U+1F47A|&#1F47A;|creature, face, fairy tale, fantasy, goblin, japanese, monster, person|
|💀|SKULL|U+1F480|&#1F480;|body, death, face, fairy tale, monster, person, skull|
|☠|SKULL AND CROSSBONES|U+2620|&#2620;|body, crossbones, death, face, monster, person, skull|
|👻|GHOST|U+1F47B|&#1F47B;|creature, face, fairy tale, fantasy, ghost, monster, person|
|👽|EXTRATERRESTRIAL ALIEN|U+1F47D|&#1F47D;|alien, creature, extraterrestrial, face, fairy tale, fantasy, monster, nature, person, space, ufo|
|👾|ALIEN MONSTER|U+1F47E|&#1F47E;|alien, creature, extraterrestrial, face, fairy tale, fantasy, monster, nature, person, space, ufo|
|🤖|ROBOT FACE|U+1F916|&#1F916;|face, monster, person, robot|
|💩|PILE OF POO|U+1F4A9|&#1F4A9;|comic, dung, face, monster, nature, object, poo, poop|
|😺|SMILING CAT FACE WITH OPEN MOUTH|U+1F63A|&#1F63A;|animal, cat, face, mouth, nature, open, smile|
|😸|GRINNING CAT FACE WITH SMILING EYES|U+1F638|&#1F638;|animal, cat, eye, face, grin, nature, smile|
|😹|CAT FACE WITH TEARS OF JOY|U+1F639|&#1F639;|animal, cat, face, joy, nature, tear|
|😻|SMILING CAT FACE WITH HEART-SHAPED EYES|U+1F63B|&#1F63B;|animal, cat, eye, face, heart, love, nature, smile|
|😼|CAT FACE WITH WRY SMILE|U+1F63C|&#1F63C;|animal, cat, face, ironic, nature, smile, wry|
|😽|KISSING CAT FACE WITH CLOSED EYES|U+1F63D|&#1F63D;|animal, cat, eye, face, kiss, nature|
|🙀|WEARY CAT FACE|U+1F640|&#1F640;|animal, cat, face, nature, oh, surprised, weary|
|😿|CRYING CAT FACE|U+1F63F|&#1F63F;|animal, cat, cry, face, nature, sad, tear|
|😾|POUTING CAT FACE|U+1F63E|&#1F63E;|animal, cat, face, nature, pouting|
|🙈|SEE-NO-EVIL MONKEY|U+1F648|&#1F648;|animal, evil, face, forbidden, gesture, monkey, nature, no, not, prohibited, see|
|🙉|HEAR-NO-EVIL MONKEY|U+1F649|&#1F649;|animal, evil, face, forbidden, gesture, hear, monkey, nature, no, not, prohibited|
|🙊|SPEAK-NO-EVIL MONKEY|U+1F64A|&#1F64A;|animal, evil, face, forbidden, gesture, monkey, nature, no, not, prohibited, speak|
|👦|BOY|U+1F466|&#1F466;|boy, person|
|👦🏻|BOY, TYPE-1-2|U+1F466 U+1F3FB|&#1F466;&#1F3FB;||
|👦🏼|BOY, TYPE-3|U+1F466 U+1F3FC|&#1F466;&#1F3FC;||
|👦🏽|BOY, TYPE-4|U+1F466 U+1F3FD|&#1F466;&#1F3FD;||
|👦🏾|BOY, TYPE-5|U+1F466 U+1F3FE|&#1F466;&#1F3FE;||
|👦🏿|BOY, TYPE-6|U+1F466 U+1F3FF|&#1F466;&#1F3FF;||
|👧|GIRL|U+1F467|&#1F467;|girl, maiden, person, virgin, virgo, zodiac|
|👧🏻|GIRL, TYPE-1-2|U+1F467 U+1F3FB|&#1F467;&#1F3FB;||
|👧🏼|GIRL, TYPE-3|U+1F467 U+1F3FC|&#1F467;&#1F3FC;||
|👧🏽|GIRL, TYPE-4|U+1F467 U+1F3FD|&#1F467;&#1F3FD;||
|👧🏾|GIRL, TYPE-5|U+1F467 U+1F3FE|&#1F467;&#1F3FE;||
|👧🏿|GIRL, TYPE-6|U+1F467 U+1F3FF|&#1F467;&#1F3FF;||
|👨|MAN|U+1F468|&#1F468;|man, person|
|👨🏻|MAN, TYPE-1-2|U+1F468 U+1F3FB|&#1F468;&#1F3FB;||
|👨🏼|MAN, TYPE-3|U+1F468 U+1F3FC|&#1F468;&#1F3FC;||
|👨🏽|MAN, TYPE-4|U+1F468 U+1F3FD|&#1F468;&#1F3FD;||
|👨🏾|MAN, TYPE-5|U+1F468 U+1F3FE|&#1F468;&#1F3FE;||
|👨🏿|MAN, TYPE-6|U+1F468 U+1F3FF|&#1F468;&#1F3FF;||
|👩|WOMAN|U+1F469|&#1F469;|person, woman|
|👩🏻|WOMAN, TYPE-1-2|U+1F469 U+1F3FB|&#1F469;&#1F3FB;||
|👩🏼|WOMAN, TYPE-3|U+1F469 U+1F3FC|&#1F469;&#1F3FC;||
|👩🏽|WOMAN, TYPE-4|U+1F469 U+1F3FD|&#1F469;&#1F3FD;||
|👩🏾|WOMAN, TYPE-5|U+1F469 U+1F3FE|&#1F469;&#1F3FE;||
|👩🏿|WOMAN, TYPE-6|U+1F469 U+1F3FF|&#1F469;&#1F3FF;||
|👴|OLDER MAN|U+1F474|&#1F474;|man, old, person|
|👴🏻|OLDER MAN, TYPE-1-2|U+1F474 U+1F3FB|&#1F474;&#1F3FB;||
|👴🏼|OLDER MAN, TYPE-3|U+1F474 U+1F3FC|&#1F474;&#1F3FC;||
|👴🏽|OLDER MAN, TYPE-4|U+1F474 U+1F3FD|&#1F474;&#1F3FD;||
|👴🏾|OLDER MAN, TYPE-5|U+1F474 U+1F3FE|&#1F474;&#1F3FE;||
|👴🏿|OLDER MAN, TYPE-6|U+1F474 U+1F3FF|&#1F474;&#1F3FF;||
|👵|OLDER WOMAN|U+1F475|&#1F475;|old, person, woman|
|👵🏻|OLDER WOMAN, TYPE-1-2|U+1F475 U+1F3FB|&#1F475;&#1F3FB;||
|👵🏼|OLDER WOMAN, TYPE-3|U+1F475 U+1F3FC|&#1F475;&#1F3FC;||
|👵🏽|OLDER WOMAN, TYPE-4|U+1F475 U+1F3FD|&#1F475;&#1F3FD;||
|👵🏾|OLDER WOMAN, TYPE-5|U+1F475 U+1F3FE|&#1F475;&#1F3FE;||
|👵🏿|OLDER WOMAN, TYPE-6|U+1F475 U+1F3FF|&#1F475;&#1F3FF;||
|👶|BABY|U+1F476|&#1F476;|baby, person|
|👶🏻|BABY, TYPE-1-2|U+1F476 U+1F3FB|&#1F476;&#1F3FB;||
|👶🏼|BABY, TYPE-3|U+1F476 U+1F3FC|&#1F476;&#1F3FC;||
|👶🏽|BABY, TYPE-4|U+1F476 U+1F3FD|&#1F476;&#1F3FD;||
|👶🏾|BABY, TYPE-5|U+1F476 U+1F3FE|&#1F476;&#1F3FE;||
|👶🏿|BABY, TYPE-6|U+1F476 U+1F3FF|&#1F476;&#1F3FF;||
|👱|PERSON WITH BLOND HAIR|U+1F471|&#1F471;|blond, person|
|👱🏻|PERSON WITH BLOND HAIR, TYPE-1-2|U+1F471 U+1F3FB|&#1F471;&#1F3FB;||
|👱🏼|PERSON WITH BLOND HAIR, TYPE-3|U+1F471 U+1F3FC|&#1F471;&#1F3FC;||
|👱🏽|PERSON WITH BLOND HAIR, TYPE-4|U+1F471 U+1F3FD|&#1F471;&#1F3FD;||
|👱🏾|PERSON WITH BLOND HAIR, TYPE-5|U+1F471 U+1F3FE|&#1F471;&#1F3FE;||
|👱🏿|PERSON WITH BLOND HAIR, TYPE-6|U+1F471 U+1F3FF|&#1F471;&#1F3FF;||
|👮|POLICE OFFICER|U+1F46E|&#1F46E;|cop, officer, person, police|
|👮🏻|POLICE OFFICER, TYPE-1-2|U+1F46E U+1F3FB|&#1F46E;&#1F3FB;||
|👮🏼|POLICE OFFICER, TYPE-3|U+1F46E U+1F3FC|&#1F46E;&#1F3FC;||
|👮🏽|POLICE OFFICER, TYPE-4|U+1F46E U+1F3FD|&#1F46E;&#1F3FD;||
|👮🏾|POLICE OFFICER, TYPE-5|U+1F46E U+1F3FE|&#1F46E;&#1F3FE;||
|👮🏿|POLICE OFFICER, TYPE-6|U+1F46E U+1F3FF|&#1F46E;&#1F3FF;||
|👲|MAN WITH GUA PI MAO|U+1F472|&#1F472;|gua pi mao, hat, man, person|
|👲🏻|MAN WITH GUA PI MAO, TYPE-1-2|U+1F472 U+1F3FB|&#1F472;&#1F3FB;||
|👲🏼|MAN WITH GUA PI MAO, TYPE-3|U+1F472 U+1F3FC|&#1F472;&#1F3FC;||
|👲🏽|MAN WITH GUA PI MAO, TYPE-4|U+1F472 U+1F3FD|&#1F472;&#1F3FD;||
|👲🏾|MAN WITH GUA PI MAO, TYPE-5|U+1F472 U+1F3FE|&#1F472;&#1F3FE;||
|👲🏿|MAN WITH GUA PI MAO, TYPE-6|U+1F472 U+1F3FF|&#1F472;&#1F3FF;||
|👳|MAN WITH TURBAN|U+1F473|&#1F473;|man, person, turban|
|👳🏻|MAN WITH TURBAN, TYPE-1-2|U+1F473 U+1F3FB|&#1F473;&#1F3FB;||
|👳🏼|MAN WITH TURBAN, TYPE-3|U+1F473 U+1F3FC|&#1F473;&#1F3FC;||
|👳🏽|MAN WITH TURBAN, TYPE-4|U+1F473 U+1F3FD|&#1F473;&#1F3FD;||
|👳🏾|MAN WITH TURBAN, TYPE-5|U+1F473 U+1F3FE|&#1F473;&#1F3FE;||
|👳🏿|MAN WITH TURBAN, TYPE-6|U+1F473 U+1F3FF|&#1F473;&#1F3FF;||
|👷|CONSTRUCTION WORKER|U+1F477|&#1F477;|construction, hat, person, worker|
|👷🏻|CONSTRUCTION WORKER, TYPE-1-2|U+1F477 U+1F3FB|&#1F477;&#1F3FB;||
|👷🏼|CONSTRUCTION WORKER, TYPE-3|U+1F477 U+1F3FC|&#1F477;&#1F3FC;||
|👷🏽|CONSTRUCTION WORKER, TYPE-4|U+1F477 U+1F3FD|&#1F477;&#1F3FD;||
|👷🏾|CONSTRUCTION WORKER, TYPE-5|U+1F477 U+1F3FE|&#1F477;&#1F3FE;||
|👷🏿|CONSTRUCTION WORKER, TYPE-6|U+1F477 U+1F3FF|&#1F477;&#1F3FF;||
|⛑|HELMET WITH WHITE CROSS|U+26D1|&#26D1;|aid, cross, face, hat, helmet, person|
|👸|PRINCESS|U+1F478|&#1F478;|fairy tale, fantasy, person, princess|
|👸🏻|PRINCESS, TYPE-1-2|U+1F478 U+1F3FB|&#1F478;&#1F3FB;||
|👸🏼|PRINCESS, TYPE-3|U+1F478 U+1F3FC|&#1F478;&#1F3FC;||
|👸🏽|PRINCESS, TYPE-4|U+1F478 U+1F3FD|&#1F478;&#1F3FD;||
|👸🏾|PRINCESS, TYPE-5|U+1F478 U+1F3FE|&#1F478;&#1F3FE;||
|👸🏿|PRINCESS, TYPE-6|U+1F478 U+1F3FF|&#1F478;&#1F3FF;||
|💂|GUARDSMAN|U+1F482|&#1F482;|guard, guardsman, person|
|💂🏻|GUARDSMAN, TYPE-1-2|U+1F482 U+1F3FB|&#1F482;&#1F3FB;||
|💂🏼|GUARDSMAN, TYPE-3|U+1F482 U+1F3FC|&#1F482;&#1F3FC;||
|💂🏽|GUARDSMAN, TYPE-4|U+1F482 U+1F3FD|&#1F482;&#1F3FD;||
|💂🏾|GUARDSMAN, TYPE-5|U+1F482 U+1F3FE|&#1F482;&#1F3FE;||
|💂🏿|GUARDSMAN, TYPE-6|U+1F482 U+1F3FF|&#1F482;&#1F3FF;||
|🕵|SLEUTH OR SPY|U+1F575|&#1F575;|detective, person, sleuth, spy|
|🕵🏻|SLEUTH OR SPY, TYPE-1-2|U+1F575 U+1F3FB|&#1F575;&#1F3FB;||
|🕵🏼|SLEUTH OR SPY, TYPE-3|U+1F575 U+1F3FC|&#1F575;&#1F3FC;||
|🕵🏽|SLEUTH OR SPY, TYPE-4|U+1F575 U+1F3FD|&#1F575;&#1F3FD;||
|🕵🏾|SLEUTH OR SPY, TYPE-5|U+1F575 U+1F3FE|&#1F575;&#1F3FE;||
|🕵🏿|SLEUTH OR SPY, TYPE-6|U+1F575 U+1F3FF|&#1F575;&#1F3FF;||
|🎅|FATHER CHRISTMAS|U+1F385|&#1F385;|activity, celebration, christmas, fairy tale, fantasy, father, person, santa|
|🎅🏻|FATHER CHRISTMAS, TYPE-1-2|U+1F385 U+1F3FB|&#1F385;&#1F3FB;||
|🎅🏼|FATHER CHRISTMAS, TYPE-3|U+1F385 U+1F3FC|&#1F385;&#1F3FC;||
|🎅🏽|FATHER CHRISTMAS, TYPE-4|U+1F385 U+1F3FD|&#1F385;&#1F3FD;||
|🎅🏾|FATHER CHRISTMAS, TYPE-5|U+1F385 U+1F3FE|&#1F385;&#1F3FE;||
|🎅🏿|FATHER CHRISTMAS, TYPE-6|U+1F385 U+1F3FF|&#1F385;&#1F3FF;||
|👰|BRIDE WITH VEIL|U+1F470|&#1F470;|bride, person, veil, wedding|
|👰🏻|BRIDE WITH VEIL, TYPE-1-2|U+1F470 U+1F3FB|&#1F470;&#1F3FB;||
|👰🏼|BRIDE WITH VEIL, TYPE-3|U+1F470 U+1F3FC|&#1F470;&#1F3FC;||
|👰🏽|BRIDE WITH VEIL, TYPE-4|U+1F470 U+1F3FD|&#1F470;&#1F3FD;||
|👰🏾|BRIDE WITH VEIL, TYPE-5|U+1F470 U+1F3FE|&#1F470;&#1F3FE;||
|👰🏿|BRIDE WITH VEIL, TYPE-6|U+1F470 U+1F3FF|&#1F470;&#1F3FF;||
|👼|BABY ANGEL|U+1F47C|&#1F47C;|angel, baby, face, fairy tale, fantasy, person|
|👼🏻|BABY ANGEL, TYPE-1-2|U+1F47C U+1F3FB|&#1F47C;&#1F3FB;||
|👼🏼|BABY ANGEL, TYPE-3|U+1F47C U+1F3FC|&#1F47C;&#1F3FC;||
|👼🏽|BABY ANGEL, TYPE-4|U+1F47C U+1F3FD|&#1F47C;&#1F3FD;||
|👼🏾|BABY ANGEL, TYPE-5|U+1F47C U+1F3FE|&#1F47C;&#1F3FE;||
|👼🏿|BABY ANGEL, TYPE-6|U+1F47C U+1F3FF|&#1F47C;&#1F3FF;||
|💆|FACE MASSAGE|U+1F486|&#1F486;|massage, person, salon|
|💆🏻|FACE MASSAGE, TYPE-1-2|U+1F486 U+1F3FB|&#1F486;&#1F3FB;||
|💆🏼|FACE MASSAGE, TYPE-3|U+1F486 U+1F3FC|&#1F486;&#1F3FC;||
|💆🏽|FACE MASSAGE, TYPE-4|U+1F486 U+1F3FD|&#1F486;&#1F3FD;||
|💆🏾|FACE MASSAGE, TYPE-5|U+1F486 U+1F3FE|&#1F486;&#1F3FE;||
|💆🏿|FACE MASSAGE, TYPE-6|U+1F486 U+1F3FF|&#1F486;&#1F3FF;||
|💇|HAIRCUT|U+1F487|&#1F487;|barber, beauty, haircut, parlor, person|
|💇🏻|HAIRCUT, TYPE-1-2|U+1F487 U+1F3FB|&#1F487;&#1F3FB;||
|💇🏼|HAIRCUT, TYPE-3|U+1F487 U+1F3FC|&#1F487;&#1F3FC;||
|💇🏽|HAIRCUT, TYPE-4|U+1F487 U+1F3FD|&#1F487;&#1F3FD;||
|💇🏾|HAIRCUT, TYPE-5|U+1F487 U+1F3FE|&#1F487;&#1F3FE;||
|💇🏿|HAIRCUT, TYPE-6|U+1F487 U+1F3FF|&#1F487;&#1F3FF;||
|🙍|PERSON FROWNING|U+1F64D|&#1F64D;|frown, gesture, person|
|🙍🏻|PERSON FROWNING, TYPE-1-2|U+1F64D U+1F3FB|&#1F64D;&#1F3FB;||
|🙍🏼|PERSON FROWNING, TYPE-3|U+1F64D U+1F3FC|&#1F64D;&#1F3FC;||
|🙍🏽|PERSON FROWNING, TYPE-4|U+1F64D U+1F3FD|&#1F64D;&#1F3FD;||
|🙍🏾|PERSON FROWNING, TYPE-5|U+1F64D U+1F3FE|&#1F64D;&#1F3FE;||
|🙍🏿|PERSON FROWNING, TYPE-6|U+1F64D U+1F3FF|&#1F64D;&#1F3FF;||
|🙎|PERSON WITH POUTING FACE|U+1F64E|&#1F64E;|gesture, person, pouting|
|🙎🏻|PERSON WITH POUTING FACE, TYPE-1-2|U+1F64E U+1F3FB|&#1F64E;&#1F3FB;||
|🙎🏼|PERSON WITH POUTING FACE, TYPE-3|U+1F64E U+1F3FC|&#1F64E;&#1F3FC;||
|🙎🏽|PERSON WITH POUTING FACE, TYPE-4|U+1F64E U+1F3FD|&#1F64E;&#1F3FD;||
|🙎🏾|PERSON WITH POUTING FACE, TYPE-5|U+1F64E U+1F3FE|&#1F64E;&#1F3FE;||
|🙎🏿|PERSON WITH POUTING FACE, TYPE-6|U+1F64E U+1F3FF|&#1F64E;&#1F3FF;||
|🙅|FACE WITH NO GOOD GESTURE|U+1F645|&#1F645;|forbidden, gesture, hand, no, not, person, prohibited|
|🙅🏻|FACE WITH NO GOOD GESTURE, TYPE-1-2|U+1F645 U+1F3FB|&#1F645;&#1F3FB;||
|🙅🏼|FACE WITH NO GOOD GESTURE, TYPE-3|U+1F645 U+1F3FC|&#1F645;&#1F3FC;||
|🙅🏽|FACE WITH NO GOOD GESTURE, TYPE-4|U+1F645 U+1F3FD|&#1F645;&#1F3FD;||
|🙅🏾|FACE WITH NO GOOD GESTURE, TYPE-5|U+1F645 U+1F3FE|&#1F645;&#1F3FE;||
|🙅🏿|FACE WITH NO GOOD GESTURE, TYPE-6|U+1F645 U+1F3FF|&#1F645;&#1F3FF;||
|🙆|FACE WITH OK GESTURE|U+1F646|&#1F646;|gesture, hand, ok, person|
|🙆🏻|FACE WITH OK GESTURE, TYPE-1-2|U+1F646 U+1F3FB|&#1F646;&#1F3FB;||
|🙆🏼|FACE WITH OK GESTURE, TYPE-3|U+1F646 U+1F3FC|&#1F646;&#1F3FC;||
|🙆🏽|FACE WITH OK GESTURE, TYPE-4|U+1F646 U+1F3FD|&#1F646;&#1F3FD;||
|🙆🏾|FACE WITH OK GESTURE, TYPE-5|U+1F646 U+1F3FE|&#1F646;&#1F3FE;||
|🙆🏿|FACE WITH OK GESTURE, TYPE-6|U+1F646 U+1F3FF|&#1F646;&#1F3FF;||
|💁|INFORMATION DESK PERSON|U+1F481|&#1F481;|hand, help, information, person, sassy|
|💁🏻|INFORMATION DESK PERSON, TYPE-1-2|U+1F481 U+1F3FB|&#1F481;&#1F3FB;||
|💁🏼|INFORMATION DESK PERSON, TYPE-3|U+1F481 U+1F3FC|&#1F481;&#1F3FC;||
|💁🏽|INFORMATION DESK PERSON, TYPE-4|U+1F481 U+1F3FD|&#1F481;&#1F3FD;||
|💁🏾|INFORMATION DESK PERSON, TYPE-5|U+1F481 U+1F3FE|&#1F481;&#1F3FE;||
|💁🏿|INFORMATION DESK PERSON, TYPE-6|U+1F481 U+1F3FF|&#1F481;&#1F3FF;||
|🙋|HAPPY PERSON RAISING ONE HAND|U+1F64B|&#1F64B;|gesture, hand, happy, person, raised|
|🙋🏻|HAPPY PERSON RAISING ONE HAND, TYPE-1-2|U+1F64B U+1F3FB|&#1F64B;&#1F3FB;||
|🙋🏼|HAPPY PERSON RAISING ONE HAND, TYPE-3|U+1F64B U+1F3FC|&#1F64B;&#1F3FC;||
|🙋🏽|HAPPY PERSON RAISING ONE HAND, TYPE-4|U+1F64B U+1F3FD|&#1F64B;&#1F3FD;||
|🙋🏾|HAPPY PERSON RAISING ONE HAND, TYPE-5|U+1F64B U+1F3FE|&#1F64B;&#1F3FE;||
|🙋🏿|HAPPY PERSON RAISING ONE HAND, TYPE-6|U+1F64B U+1F3FF|&#1F64B;&#1F3FF;||
|🙇|PERSON BOWING DEEPLY|U+1F647|&#1F647;|apology, bow, gesture, person, sorry|
|🙇🏻|PERSON BOWING DEEPLY, TYPE-1-2|U+1F647 U+1F3FB|&#1F647;&#1F3FB;||
|🙇🏼|PERSON BOWING DEEPLY, TYPE-3|U+1F647 U+1F3FC|&#1F647;&#1F3FC;||
|🙇🏽|PERSON BOWING DEEPLY, TYPE-4|U+1F647 U+1F3FD|&#1F647;&#1F3FD;||
|🙇🏾|PERSON BOWING DEEPLY, TYPE-5|U+1F647 U+1F3FE|&#1F647;&#1F3FE;||
|🙇🏿|PERSON BOWING DEEPLY, TYPE-6|U+1F647 U+1F3FF|&#1F647;&#1F3FF;||
|🙌|PERSON RAISING BOTH HANDS IN CELEBRATION|U+1F64C|&#1F64C;|body, celebration, gesture, hand, hooray, person, raised|
|🙌🏻|PERSON RAISING BOTH HANDS IN CELEBRATION, TYPE-1-2|U+1F64C U+1F3FB|&#1F64C;&#1F3FB;||
|🙌🏼|PERSON RAISING BOTH HANDS IN CELEBRATION, TYPE-3|U+1F64C U+1F3FC|&#1F64C;&#1F3FC;||
|🙌🏽|PERSON RAISING BOTH HANDS IN CELEBRATION, TYPE-4|U+1F64C U+1F3FD|&#1F64C;&#1F3FD;||
|🙌🏾|PERSON RAISING BOTH HANDS IN CELEBRATION, TYPE-5|U+1F64C U+1F3FE|&#1F64C;&#1F3FE;||
|🙌🏿|PERSON RAISING BOTH HANDS IN CELEBRATION, TYPE-6|U+1F64C U+1F3FF|&#1F64C;&#1F3FF;||
|🙏|PERSON WITH FOLDED HANDS|U+1F64F|&#1F64F;|ask, body, bow, folded, gesture, hand, person, please, pray, thanks|
|🙏🏻|PERSON WITH FOLDED HANDS, TYPE-1-2|U+1F64F U+1F3FB|&#1F64F;&#1F3FB;||
|🙏🏼|PERSON WITH FOLDED HANDS, TYPE-3|U+1F64F U+1F3FC|&#1F64F;&#1F3FC;||
|🙏🏽|PERSON WITH FOLDED HANDS, TYPE-4|U+1F64F U+1F3FD|&#1F64F;&#1F3FD;||
|🙏🏾|PERSON WITH FOLDED HANDS, TYPE-5|U+1F64F U+1F3FE|&#1F64F;&#1F3FE;||
|🙏🏿|PERSON WITH FOLDED HANDS, TYPE-6|U+1F64F U+1F3FF|&#1F64F;&#1F3FF;||
|🗣|SPEAKING HEAD IN SILHOUETTE|U+1F5E3|&#1F5E3;|face, head, person, silhouette, speak, speaking|
|👤|BUST IN SILHOUETTE|U+1F464|&#1F464;|bust, person, silhouette|
|👥|BUSTS IN SILHOUETTE|U+1F465|&#1F465;|bust, person, silhouette|
|🚶|PEDESTRIAN|U+1F6B6|&#1F6B6;|hike, pedestrian, person, walk, walking|
|🚶🏻|PEDESTRIAN, TYPE-1-2|U+1F6B6 U+1F3FB|&#1F6B6;&#1F3FB;||
|🚶🏼|PEDESTRIAN, TYPE-3|U+1F6B6 U+1F3FC|&#1F6B6;&#1F3FC;||
|🚶🏽|PEDESTRIAN, TYPE-4|U+1F6B6 U+1F3FD|&#1F6B6;&#1F3FD;||
|🚶🏾|PEDESTRIAN, TYPE-5|U+1F6B6 U+1F3FE|&#1F6B6;&#1F3FE;||
|🚶🏿|PEDESTRIAN, TYPE-6|U+1F6B6 U+1F3FF|&#1F6B6;&#1F3FF;||
|🏃|RUNNER|U+1F3C3|&#1F3C3;|marathon, person, runner, running|
|🏃🏻|RUNNER, TYPE-1-2|U+1F3C3 U+1F3FB|&#1F3C3;&#1F3FB;||
|🏃🏼|RUNNER, TYPE-3|U+1F3C3 U+1F3FC|&#1F3C3;&#1F3FC;||
|🏃🏽|RUNNER, TYPE-4|U+1F3C3 U+1F3FD|&#1F3C3;&#1F3FD;||
|🏃🏾|RUNNER, TYPE-5|U+1F3C3 U+1F3FE|&#1F3C3;&#1F3FE;||
|🏃🏿|RUNNER, TYPE-6|U+1F3C3 U+1F3FF|&#1F3C3;&#1F3FF;||
|👯|WOMAN WITH BUNNY EARS|U+1F46F|&#1F46F;|bunny, dancer, ear, girl, person, woman|
|💃|DANCER|U+1F483|&#1F483;|dancer, person|
|💃🏻|DANCER, TYPE-1-2|U+1F483 U+1F3FB|&#1F483;&#1F3FB;||
|💃🏼|DANCER, TYPE-3|U+1F483 U+1F3FC|&#1F483;&#1F3FC;||
|💃🏽|DANCER, TYPE-4|U+1F483 U+1F3FD|&#1F483;&#1F3FD;||
|💃🏾|DANCER, TYPE-5|U+1F483 U+1F3FE|&#1F483;&#1F3FE;||
|💃🏿|DANCER, TYPE-6|U+1F483 U+1F3FF|&#1F483;&#1F3FF;||
|🕴|MAN IN BUSINESS SUIT LEVITATING|U+1F574|&#1F574;|business, man, person, suit|
|👫|MAN AND WOMAN HOLDING HANDS|U+1F46B|&#1F46B;|couple, hand, hold, man, person, woman|
|👬|TWO MEN HOLDING HANDS|U+1F46C|&#1F46C;|couple, gemini, hand, hold, man, person, twins, zodiac|
|👭|TWO WOMEN HOLDING HANDS|U+1F46D|&#1F46D;|couple, hand, hold, person, woman|
|💏|KISS|U+1F48F|&#1F48F;|couple, kiss, person, romance|
|👩‍❤️‍💋‍👨|Kiss: WOMAN, MAN|U+1F469 U+200D U+2764 U+FE0F U+200D U+1F48B U+200D U+1F468|&#1F469;&#200D;&#2764;&#FE0F;&#200D;&#1F48B;&#200D;&#1F468;|kiss, man, woman|
|👨‍❤️‍💋‍👨|Kiss: MAN, MAN|U+1F468 U+200D U+2764 U+FE0F U+200D U+1F48B U+200D U+1F468|&#1F468;&#200D;&#2764;&#FE0F;&#200D;&#1F48B;&#200D;&#1F468;|kiss, man|
|👩‍❤️‍💋‍👩|Kiss: WOMAN, WOMAN|U+1F469 U+200D U+2764 U+FE0F U+200D U+1F48B U+200D U+1F469|&#1F469;&#200D;&#2764;&#FE0F;&#200D;&#1F48B;&#200D;&#1F469;|kiss, woman|
|💑|COUPLE WITH HEART|U+1F491|&#1F491;|couple, heart, love, person, romance|
|👩‍❤️‍👨|Couple with heart: WOMAN, MAN|U+1F469 U+200D U+2764 U+FE0F U+200D U+1F468|&#1F469;&#200D;&#2764;&#FE0F;&#200D;&#1F468;|couple, man, woman|
|👨‍❤️‍👨|Couple with heart: MAN, MAN|U+1F468 U+200D U+2764 U+FE0F U+200D U+1F468|&#1F468;&#200D;&#2764;&#FE0F;&#200D;&#1F468;|couple, man|
|👩‍❤️‍👩|Couple with heart: WOMAN, WOMAN|U+1F469 U+200D U+2764 U+FE0F U+200D U+1F469|&#1F469;&#200D;&#2764;&#FE0F;&#200D;&#1F469;|couple, woman|
|👪|FAMILY|U+1F46A|&#1F46A;|child, family, father, mother, person|
|👨‍👩‍👦|Family: MAN, WOMAN, BOY|U+1F468 U+200D U+1F469 U+200D U+1F466|&#1F468;&#200D;&#1F469;&#200D;&#1F466;|boy, family, man, woman|
|👨‍👩‍👧|Family: MAN, WOMAN, GIRL|U+1F468 U+200D U+1F469 U+200D U+1F467|&#1F468;&#200D;&#1F469;&#200D;&#1F467;|family, girl, man, woman|
|👨‍👩‍👧‍👦|Family: MAN, WOMAN, GIRL, BOY|U+1F468 U+200D U+1F469 U+200D U+1F467 U+200D U+1F466|&#1F468;&#200D;&#1F469;&#200D;&#1F467;&#200D;&#1F466;|boy, family, girl, man, woman|
|👨‍👩‍👦‍👦|Family: MAN, WOMAN, BOY, BOY|U+1F468 U+200D U+1F469 U+200D U+1F466 U+200D U+1F466|&#1F468;&#200D;&#1F469;&#200D;&#1F466;&#200D;&#1F466;|boy, family, man, woman|
|👨‍👩‍👧‍👧|Family: MAN, WOMAN, GIRL, GIRL|U+1F468 U+200D U+1F469 U+200D U+1F467 U+200D U+1F467|&#1F468;&#200D;&#1F469;&#200D;&#1F467;&#200D;&#1F467;|family, girl, man, woman|
|👨‍👨‍👦|Family: MAN, MAN, BOY|U+1F468 U+200D U+1F468 U+200D U+1F466|&#1F468;&#200D;&#1F468;&#200D;&#1F466;|boy, family, man|
|👨‍👨‍👧|Family: MAN, MAN, GIRL|U+1F468 U+200D U+1F468 U+200D U+1F467|&#1F468;&#200D;&#1F468;&#200D;&#1F467;|family, girl, man|
|👨‍👨‍👧‍👦|Family: MAN, MAN, GIRL, BOY|U+1F468 U+200D U+1F468 U+200D U+1F467 U+200D U+1F466|&#1F468;&#200D;&#1F468;&#200D;&#1F467;&#200D;&#1F466;|boy, family, girl, man|
|👨‍👨‍👦‍👦|Family: MAN, MAN, BOY, BOY|U+1F468 U+200D U+1F468 U+200D U+1F466 U+200D U+1F466|&#1F468;&#200D;&#1F468;&#200D;&#1F466;&#200D;&#1F466;|boy, family, man|
|👨‍👨‍👧‍👧|Family: MAN, MAN, GIRL, GIRL|U+1F468 U+200D U+1F468 U+200D U+1F467 U+200D U+1F467|&#1F468;&#200D;&#1F468;&#200D;&#1F467;&#200D;&#1F467;|family, girl, man|
|👩‍👩‍👦|Family: WOMAN, WOMAN, BOY|U+1F469 U+200D U+1F469 U+200D U+1F466|&#1F469;&#200D;&#1F469;&#200D;&#1F466;|boy, family, woman|
|👩‍👩‍👧|Family: WOMAN, WOMAN, GIRL|U+1F469 U+200D U+1F469 U+200D U+1F467|&#1F469;&#200D;&#1F469;&#200D;&#1F467;|family, girl, woman|
|👩‍👩‍👧‍👦|Family: WOMAN, WOMAN, GIRL, BOY|U+1F469 U+200D U+1F469 U+200D U+1F467 U+200D U+1F466|&#1F469;&#200D;&#1F469;&#200D;&#1F467;&#200D;&#1F466;|boy, family, girl, woman|
|👩‍👩‍👦‍👦|Family: WOMAN, WOMAN, BOY, BOY|U+1F469 U+200D U+1F469 U+200D U+1F466 U+200D U+1F466|&#1F469;&#200D;&#1F469;&#200D;&#1F466;&#200D;&#1F466;|boy, family, woman|
|👩‍👩‍👧‍👧|Family: WOMAN, WOMAN, GIRL, GIRL|U+1F469 U+200D U+1F469 U+200D U+1F467 U+200D U+1F467|&#1F469;&#200D;&#1F469;&#200D;&#1F467;&#200D;&#1F467;|family, girl, woman|
|🏻|EMOJI MODIFIER FITZPATRICK TYPE-1-2|U+1F3FB|&#1F3FB;|emoji modifier, fitzpatrick, skin, symbol, tone|
|🏼|EMOJI MODIFIER FITZPATRICK TYPE-3|U+1F3FC|&#1F3FC;|emoji modifier, fitzpatrick, skin, symbol, tone|
|🏽|EMOJI MODIFIER FITZPATRICK TYPE-4|U+1F3FD|&#1F3FD;|emoji modifier, fitzpatrick, skin, symbol, tone|
|🏾|EMOJI MODIFIER FITZPATRICK TYPE-5|U+1F3FE|&#1F3FE;|emoji modifier, fitzpatrick, skin, symbol, tone|
|🏿|EMOJI MODIFIER FITZPATRICK TYPE-6|U+1F3FF|&#1F3FF;|emoji modifier, fitzpatrick, skin, symbol, tone|
|💪|FLEXED BICEPS|U+1F4AA|&#1F4AA;|biceps, body, comic, flex, muscle, person|
|💪🏻|FLEXED BICEPS, TYPE-1-2|U+1F4AA U+1F3FB|&#1F4AA;&#1F3FB;||
|💪🏼|FLEXED BICEPS, TYPE-3|U+1F4AA U+1F3FC|&#1F4AA;&#1F3FC;||
|💪🏽|FLEXED BICEPS, TYPE-4|U+1F4AA U+1F3FD|&#1F4AA;&#1F3FD;||
|💪🏾|FLEXED BICEPS, TYPE-5|U+1F4AA U+1F3FE|&#1F4AA;&#1F3FE;||
|💪🏿|FLEXED BICEPS, TYPE-6|U+1F4AA U+1F3FF|&#1F4AA;&#1F3FF;||
|👈|WHITE LEFT POINTING BACKHAND INDEX|U+1F448|&#1F448;|backhand, body, finger, hand, index, person, point|
|👈🏻|WHITE LEFT POINTING BACKHAND INDEX, TYPE-1-2|U+1F448 U+1F3FB|&#1F448;&#1F3FB;||
|👈🏼|WHITE LEFT POINTING BACKHAND INDEX, TYPE-3|U+1F448 U+1F3FC|&#1F448;&#1F3FC;||
|👈🏽|WHITE LEFT POINTING BACKHAND INDEX, TYPE-4|U+1F448 U+1F3FD|&#1F448;&#1F3FD;||
|👈🏾|WHITE LEFT POINTING BACKHAND INDEX, TYPE-5|U+1F448 U+1F3FE|&#1F448;&#1F3FE;||
|👈🏿|WHITE LEFT POINTING BACKHAND INDEX, TYPE-6|U+1F448 U+1F3FF|&#1F448;&#1F3FF;||
|👉|WHITE RIGHT POINTING BACKHAND INDEX|U+1F449|&#1F449;|backhand, body, finger, hand, index, person, point|
|👉🏻|WHITE RIGHT POINTING BACKHAND INDEX, TYPE-1-2|U+1F449 U+1F3FB|&#1F449;&#1F3FB;||
|👉🏼|WHITE RIGHT POINTING BACKHAND INDEX, TYPE-3|U+1F449 U+1F3FC|&#1F449;&#1F3FC;||
|👉🏽|WHITE RIGHT POINTING BACKHAND INDEX, TYPE-4|U+1F449 U+1F3FD|&#1F449;&#1F3FD;||
|👉🏾|WHITE RIGHT POINTING BACKHAND INDEX, TYPE-5|U+1F449 U+1F3FE|&#1F449;&#1F3FE;||
|👉🏿|WHITE RIGHT POINTING BACKHAND INDEX, TYPE-6|U+1F449 U+1F3FF|&#1F449;&#1F3FF;||
|☝|WHITE UP POINTING INDEX|U+261D|&#261D;|body, finger, hand, index, person, point, up|
|☝🏻|WHITE UP POINTING INDEX, TYPE-1-2|U+261D U+1F3FB|&#261D;&#1F3FB;||
|☝🏼|WHITE UP POINTING INDEX, TYPE-3|U+261D U+1F3FC|&#261D;&#1F3FC;||
|☝🏽|WHITE UP POINTING INDEX, TYPE-4|U+261D U+1F3FD|&#261D;&#1F3FD;||
|☝🏾|WHITE UP POINTING INDEX, TYPE-5|U+261D U+1F3FE|&#261D;&#1F3FE;||
|☝🏿|WHITE UP POINTING INDEX, TYPE-6|U+261D U+1F3FF|&#261D;&#1F3FF;||
|👆|WHITE UP POINTING BACKHAND INDEX|U+1F446|&#1F446;|backhand, body, finger, hand, index, person, point, up|
|👆🏻|WHITE UP POINTING BACKHAND INDEX, TYPE-1-2|U+1F446 U+1F3FB|&#1F446;&#1F3FB;||
|👆🏼|WHITE UP POINTING BACKHAND INDEX, TYPE-3|U+1F446 U+1F3FC|&#1F446;&#1F3FC;||
|👆🏽|WHITE UP POINTING BACKHAND INDEX, TYPE-4|U+1F446 U+1F3FD|&#1F446;&#1F3FD;||
|👆🏾|WHITE UP POINTING BACKHAND INDEX, TYPE-5|U+1F446 U+1F3FE|&#1F446;&#1F3FE;||
|👆🏿|WHITE UP POINTING BACKHAND INDEX, TYPE-6|U+1F446 U+1F3FF|&#1F446;&#1F3FF;||
|🖕|REVERSED HAND WITH MIDDLE FINGER EXTENDED|U+1F595|&#1F595;|body, finger, hand, middle finger, person|
|🖕🏻|REVERSED HAND WITH MIDDLE FINGER EXTENDED, TYPE-1-2|U+1F595 U+1F3FB|&#1F595;&#1F3FB;||
|🖕🏼|REVERSED HAND WITH MIDDLE FINGER EXTENDED, TYPE-3|U+1F595 U+1F3FC|&#1F595;&#1F3FC;||
|🖕🏽|REVERSED HAND WITH MIDDLE FINGER EXTENDED, TYPE-4|U+1F595 U+1F3FD|&#1F595;&#1F3FD;||
|🖕🏾|REVERSED HAND WITH MIDDLE FINGER EXTENDED, TYPE-5|U+1F595 U+1F3FE|&#1F595;&#1F3FE;||
|🖕🏿|REVERSED HAND WITH MIDDLE FINGER EXTENDED, TYPE-6|U+1F595 U+1F3FF|&#1F595;&#1F3FF;||
|👇|WHITE DOWN POINTING BACKHAND INDEX|U+1F447|&#1F447;|backhand, body, down, finger, hand, index, person, point|
|👇🏻|WHITE DOWN POINTING BACKHAND INDEX, TYPE-1-2|U+1F447 U+1F3FB|&#1F447;&#1F3FB;||
|👇🏼|WHITE DOWN POINTING BACKHAND INDEX, TYPE-3|U+1F447 U+1F3FC|&#1F447;&#1F3FC;||
|👇🏽|WHITE DOWN POINTING BACKHAND INDEX, TYPE-4|U+1F447 U+1F3FD|&#1F447;&#1F3FD;||
|👇🏾|WHITE DOWN POINTING BACKHAND INDEX, TYPE-5|U+1F447 U+1F3FE|&#1F447;&#1F3FE;||
|👇🏿|WHITE DOWN POINTING BACKHAND INDEX, TYPE-6|U+1F447 U+1F3FF|&#1F447;&#1F3FF;||
|✌|VICTORY HAND|U+270C|&#270C;|body, hand, person, v, victory|
|✌🏻|VICTORY HAND, TYPE-1-2|U+270C U+1F3FB|&#270C;&#1F3FB;||
|✌🏼|VICTORY HAND, TYPE-3|U+270C U+1F3FC|&#270C;&#1F3FC;||
|✌🏽|VICTORY HAND, TYPE-4|U+270C U+1F3FD|&#270C;&#1F3FD;||
|✌🏾|VICTORY HAND, TYPE-5|U+270C U+1F3FE|&#270C;&#1F3FE;||
|✌🏿|VICTORY HAND, TYPE-6|U+270C U+1F3FF|&#270C;&#1F3FF;||
|🖖|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS|U+1F596|&#1F596;|body, finger, hand, person, spock, vulcan|
|🖖🏻|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, TYPE-1-2|U+1F596 U+1F3FB|&#1F596;&#1F3FB;||
|🖖🏼|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, TYPE-3|U+1F596 U+1F3FC|&#1F596;&#1F3FC;||
|🖖🏽|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, TYPE-4|U+1F596 U+1F3FD|&#1F596;&#1F3FD;||
|🖖🏾|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, TYPE-5|U+1F596 U+1F3FE|&#1F596;&#1F3FE;||
|🖖🏿|RAISED HAND WITH PART BETWEEN MIDDLE AND RING FINGERS, TYPE-6|U+1F596 U+1F3FF|&#1F596;&#1F3FF;||
|🤘|SIGN OF THE HORNS|U+1F918|&#1F918;|body, finger, hand, horns, person, rock-on|
|🤘🏻|SIGN OF THE HORNS, TYPE-1-2|U+1F918 U+1F3FB|&#1F918;&#1F3FB;||
|🤘🏼|SIGN OF THE HORNS, TYPE-3|U+1F918 U+1F3FC|&#1F918;&#1F3FC;||
|🤘🏽|SIGN OF THE HORNS, TYPE-4|U+1F918 U+1F3FD|&#1F918;&#1F3FD;||
|🤘🏾|SIGN OF THE HORNS, TYPE-5|U+1F918 U+1F3FE|&#1F918;&#1F3FE;||
|🤘🏿|SIGN OF THE HORNS, TYPE-6|U+1F918 U+1F3FF|&#1F918;&#1F3FF;||
|🖐|RAISED HAND WITH FINGERS SPLAYED|U+1F590|&#1F590;|body, finger, hand, person, splayed|
|🖐🏻|RAISED HAND WITH FINGERS SPLAYED, TYPE-1-2|U+1F590 U+1F3FB|&#1F590;&#1F3FB;||
|🖐🏼|RAISED HAND WITH FINGERS SPLAYED, TYPE-3|U+1F590 U+1F3FC|&#1F590;&#1F3FC;||
|🖐🏽|RAISED HAND WITH FINGERS SPLAYED, TYPE-4|U+1F590 U+1F3FD|&#1F590;&#1F3FD;||
|🖐🏾|RAISED HAND WITH FINGERS SPLAYED, TYPE-5|U+1F590 U+1F3FE|&#1F590;&#1F3FE;||
|🖐🏿|RAISED HAND WITH FINGERS SPLAYED, TYPE-6|U+1F590 U+1F3FF|&#1F590;&#1F3FF;||
|✋|RAISED HAND|U+270B|&#270B;|body, hand, person|
|✋🏻|RAISED HAND, TYPE-1-2|U+270B U+1F3FB|&#270B;&#1F3FB;||
|✋🏼|RAISED HAND, TYPE-3|U+270B U+1F3FC|&#270B;&#1F3FC;||
|✋🏽|RAISED HAND, TYPE-4|U+270B U+1F3FD|&#270B;&#1F3FD;||
|✋🏾|RAISED HAND, TYPE-5|U+270B U+1F3FE|&#270B;&#1F3FE;||
|✋🏿|RAISED HAND, TYPE-6|U+270B U+1F3FF|&#270B;&#1F3FF;||
|👌|OK HAND SIGN|U+1F44C|&#1F44C;|body, hand, ok, person|
|👌🏻|OK HAND SIGN, TYPE-1-2|U+1F44C U+1F3FB|&#1F44C;&#1F3FB;||
|👌🏼|OK HAND SIGN, TYPE-3|U+1F44C U+1F3FC|&#1F44C;&#1F3FC;||
|👌🏽|OK HAND SIGN, TYPE-4|U+1F44C U+1F3FD|&#1F44C;&#1F3FD;||
|👌🏾|OK HAND SIGN, TYPE-5|U+1F44C U+1F3FE|&#1F44C;&#1F3FE;||
|👌🏿|OK HAND SIGN, TYPE-6|U+1F44C U+1F3FF|&#1F44C;&#1F3FF;||
|👍|THUMBS UP SIGN|U+1F44D|&#1F44D;|+1, body, hand, person, thumb, thumbs up, up|
|👍🏻|THUMBS UP SIGN, TYPE-1-2|U+1F44D U+1F3FB|&#1F44D;&#1F3FB;||
|👍🏼|THUMBS UP SIGN, TYPE-3|U+1F44D U+1F3FC|&#1F44D;&#1F3FC;||
|👍🏽|THUMBS UP SIGN, TYPE-4|U+1F44D U+1F3FD|&#1F44D;&#1F3FD;||
|👍🏾|THUMBS UP SIGN, TYPE-5|U+1F44D U+1F3FE|&#1F44D;&#1F3FE;||
|👍🏿|THUMBS UP SIGN, TYPE-6|U+1F44D U+1F3FF|&#1F44D;&#1F3FF;||
|👎|THUMBS DOWN SIGN|U+1F44E|&#1F44E;|-1, body, down, hand, person, thumb, thumbs down|
|👎🏻|THUMBS DOWN SIGN, TYPE-1-2|U+1F44E U+1F3FB|&#1F44E;&#1F3FB;||
|👎🏼|THUMBS DOWN SIGN, TYPE-3|U+1F44E U+1F3FC|&#1F44E;&#1F3FC;||
|👎🏽|THUMBS DOWN SIGN, TYPE-4|U+1F44E U+1F3FD|&#1F44E;&#1F3FD;||
|👎🏾|THUMBS DOWN SIGN, TYPE-5|U+1F44E U+1F3FE|&#1F44E;&#1F3FE;||
|👎🏿|THUMBS DOWN SIGN, TYPE-6|U+1F44E U+1F3FF|&#1F44E;&#1F3FF;||
|✊|RAISED FIST|U+270A|&#270A;|body, clenched, fist, hand, person, punch|
|✊🏻|RAISED FIST, TYPE-1-2|U+270A U+1F3FB|&#270A;&#1F3FB;||
|✊🏼|RAISED FIST, TYPE-3|U+270A U+1F3FC|&#270A;&#1F3FC;||
|✊🏽|RAISED FIST, TYPE-4|U+270A U+1F3FD|&#270A;&#1F3FD;||
|✊🏾|RAISED FIST, TYPE-5|U+270A U+1F3FE|&#270A;&#1F3FE;||
|✊🏿|RAISED FIST, TYPE-6|U+270A U+1F3FF|&#270A;&#1F3FF;||
|👊|FISTED HAND SIGN|U+1F44A|&#1F44A;|body, clenched, fist, hand, person, punch|
|👊🏻|FISTED HAND SIGN, TYPE-1-2|U+1F44A U+1F3FB|&#1F44A;&#1F3FB;||
|👊🏼|FISTED HAND SIGN, TYPE-3|U+1F44A U+1F3FC|&#1F44A;&#1F3FC;||
|👊🏽|FISTED HAND SIGN, TYPE-4|U+1F44A U+1F3FD|&#1F44A;&#1F3FD;||
|👊🏾|FISTED HAND SIGN, TYPE-5|U+1F44A U+1F3FE|&#1F44A;&#1F3FE;||
|👊🏿|FISTED HAND SIGN, TYPE-6|U+1F44A U+1F3FF|&#1F44A;&#1F3FF;||
|👋|WAVING HAND SIGN|U+1F44B|&#1F44B;|body, hand, person, wave, waving|
|👋🏻|WAVING HAND SIGN, TYPE-1-2|U+1F44B U+1F3FB|&#1F44B;&#1F3FB;||
|👋🏼|WAVING HAND SIGN, TYPE-3|U+1F44B U+1F3FC|&#1F44B;&#1F3FC;||
|👋🏽|WAVING HAND SIGN, TYPE-4|U+1F44B U+1F3FD|&#1F44B;&#1F3FD;||
|👋🏾|WAVING HAND SIGN, TYPE-5|U+1F44B U+1F3FE|&#1F44B;&#1F3FE;||
|👋🏿|WAVING HAND SIGN, TYPE-6|U+1F44B U+1F3FF|&#1F44B;&#1F3FF;||
|👏|CLAPPING HANDS SIGN|U+1F44F|&#1F44F;|body, clap, hand, person|
|👏🏻|CLAPPING HANDS SIGN, TYPE-1-2|U+1F44F U+1F3FB|&#1F44F;&#1F3FB;||
|👏🏼|CLAPPING HANDS SIGN, TYPE-3|U+1F44F U+1F3FC|&#1F44F;&#1F3FC;||
|👏🏽|CLAPPING HANDS SIGN, TYPE-4|U+1F44F U+1F3FD|&#1F44F;&#1F3FD;||
|👏🏾|CLAPPING HANDS SIGN, TYPE-5|U+1F44F U+1F3FE|&#1F44F;&#1F3FE;||
|👏🏿|CLAPPING HANDS SIGN, TYPE-6|U+1F44F U+1F3FF|&#1F44F;&#1F3FF;||
|👐|OPEN HANDS SIGN|U+1F450|&#1F450;|body, hand, open, person|
|👐🏻|OPEN HANDS SIGN, TYPE-1-2|U+1F450 U+1F3FB|&#1F450;&#1F3FB;||
|👐🏼|OPEN HANDS SIGN, TYPE-3|U+1F450 U+1F3FC|&#1F450;&#1F3FC;||
|👐🏽|OPEN HANDS SIGN, TYPE-4|U+1F450 U+1F3FD|&#1F450;&#1F3FD;||
|👐🏾|OPEN HANDS SIGN, TYPE-5|U+1F450 U+1F3FE|&#1F450;&#1F3FE;||
|👐🏿|OPEN HANDS SIGN, TYPE-6|U+1F450 U+1F3FF|&#1F450;&#1F3FF;||
|✍|WRITING HAND|U+270D|&#270D;|body, education, hand, person, write|
|✍🏻|WRITING HAND, TYPE-1-2|U+270D U+1F3FB|&#270D;&#1F3FB;||
|✍🏼|WRITING HAND, TYPE-3|U+270D U+1F3FC|&#270D;&#1F3FC;||
|✍🏽|WRITING HAND, TYPE-4|U+270D U+1F3FD|&#270D;&#1F3FD;||
|✍🏾|WRITING HAND, TYPE-5|U+270D U+1F3FE|&#270D;&#1F3FE;||
|✍🏿|WRITING HAND, TYPE-6|U+270D U+1F3FF|&#270D;&#1F3FF;||
|💅|NAIL POLISH|U+1F485|&#1F485;|body, care, cosmetics, manicure, nail, person, polish|
|💅🏻|NAIL POLISH, TYPE-1-2|U+1F485 U+1F3FB|&#1F485;&#1F3FB;||
|💅🏼|NAIL POLISH, TYPE-3|U+1F485 U+1F3FC|&#1F485;&#1F3FC;||
|💅🏽|NAIL POLISH, TYPE-4|U+1F485 U+1F3FD|&#1F485;&#1F3FD;||
|💅🏾|NAIL POLISH, TYPE-5|U+1F485 U+1F3FE|&#1F485;&#1F3FE;||
|💅🏿|NAIL POLISH, TYPE-6|U+1F485 U+1F3FF|&#1F485;&#1F3FF;||
|👂|EAR|U+1F442|&#1F442;|body, ear, person|
|👂🏻|EAR, TYPE-1-2|U+1F442 U+1F3FB|&#1F442;&#1F3FB;||
|👂🏼|EAR, TYPE-3|U+1F442 U+1F3FC|&#1F442;&#1F3FC;||
|👂🏽|EAR, TYPE-4|U+1F442 U+1F3FD|&#1F442;&#1F3FD;||
|👂🏾|EAR, TYPE-5|U+1F442 U+1F3FE|&#1F442;&#1F3FE;||
|👂🏿|EAR, TYPE-6|U+1F442 U+1F3FF|&#1F442;&#1F3FF;||
|👃|NOSE|U+1F443|&#1F443;|body, nose, person|
|👃🏻|NOSE, TYPE-1-2|U+1F443 U+1F3FB|&#1F443;&#1F3FB;||
|👃🏼|NOSE, TYPE-3|U+1F443 U+1F3FC|&#1F443;&#1F3FC;||
|👃🏽|NOSE, TYPE-4|U+1F443 U+1F3FD|&#1F443;&#1F3FD;||
|👃🏾|NOSE, TYPE-5|U+1F443 U+1F3FE|&#1F443;&#1F3FE;||
|👃🏿|NOSE, TYPE-6|U+1F443 U+1F3FF|&#1F443;&#1F3FF;||
|👣|FOOTPRINTS|U+1F463|&#1F463;|body, clothing, footprint, person, print|
|👀|EYES|U+1F440|&#1F440;|body, eye, face, person|
|👁|EYE|U+1F441|&#1F441;|body, eye, person|
|👁️‍🗨️|EYE, LEFT SPEECH BUBBLE|U+1F441 U+FE0F U+200D U+1F5E8 U+FE0F|&#1F441;&#FE0F;&#200D;&#1F5E8;&#FE0F;|bubble, eye, speech, witness|
|👅|TONGUE|U+1F445|&#1F445;|body, person, tongue|
|👄|MOUTH|U+1F444|&#1F444;|body, lips, mouth, person|
|💋|KISS MARK|U+1F48B|&#1F48B;|emotion, heart, kiss, lips, mark, person, romance|
|💘|HEART WITH ARROW|U+1F498|&#1F498;|arrow, cupid, emotion, heart, person, romance|
|❤|HEAVY BLACK HEART|U+2764|&#2764;|emotion, heart, person|
|💓|BEATING HEART|U+1F493|&#1F493;|beating, emotion, heart, heartbeat, person, pulsating|
|💔|BROKEN HEART|U+1F494|&#1F494;|break, broken, emotion, heart, person|
|💕|TWO HEARTS|U+1F495|&#1F495;|emotion, heart, love, person|
|💖|SPARKLING HEART|U+1F496|&#1F496;|emotion, excited, heart, person, sparkle|
|💗|GROWING HEART|U+1F497|&#1F497;|emotion, excited, growing, heart, heartpulse, nervous, person|
|💙|BLUE HEART|U+1F499|&#1F499;|blue, emotion, heart, person|
|💚|GREEN HEART|U+1F49A|&#1F49A;|emotion, green, heart, person|
|💛|YELLOW HEART|U+1F49B|&#1F49B;|emotion, heart, person, yellow|
|💜|PURPLE HEART|U+1F49C|&#1F49C;|emotion, heart, person, purple|
|💝|HEART WITH RIBBON|U+1F49D|&#1F49D;|emotion, heart, object, person, ribbon, valentine|
|💞|REVOLVING HEARTS|U+1F49E|&#1F49E;|emotion, heart, person, revolving|
|💟|HEART DECORATION|U+1F49F|&#1F49F;|emotion, heart, person, symbol|
|❣|HEAVY HEART EXCLAMATION MARK ORNAMENT|U+2763|&#2763;|emotion, exclamation, heart, mark, punctuation, symbol|
|💌|LOVE LETTER|U+1F48C|&#1F48C;|emotion, heart, letter, love, mail, person, romance|
|💤|SLEEPING SYMBOL|U+1F4A4|&#1F4A4;|comic, emotion, person, sleep, symbol, word, zzz|
|💢|ANGER SYMBOL|U+1F4A2|&#1F4A2;|angry, comic, emotion, mad, person, symbol|
|💣|BOMB|U+1F4A3|&#1F4A3;|bomb, comic, object|
|💥|COLLISION SYMBOL|U+1F4A5|&#1F4A5;|boom, collision, comic, emotion, person|
|💦|SPLASHING SWEAT SYMBOL|U+1F4A6|&#1F4A6;|comic, emotion, object, person, splashing, sweat|
|💨|DASH SYMBOL|U+1F4A8|&#1F4A8;|comic, dash, emotion, object, person, running|
|💫|DIZZY SYMBOL|U+1F4AB|&#1F4AB;|comic, dizzy, emotion, person, star|
|💬|SPEECH BALLOON|U+1F4AC|&#1F4AC;|balloon, bubble, comic, dialog, emotion, object, person, speech|
|🗨|LEFT SPEECH BUBBLE|U+1F5E8|&#1F5E8;|dialog, other, speech|
|🗯|RIGHT ANGER BUBBLE|U+1F5EF|&#1F5EF;|angry, balloon, bubble, emotion, mad, symbol|
|💭|THOUGHT BALLOON|U+1F4AD|&#1F4AD;|balloon, bubble, comic, emotion, object, person, thought|
|🕳|HOLE|U+1F573|&#1F573;|hole, symbol|
|👓|EYEGLASSES|U+1F453|&#1F453;|clothing, eye, eyeglasses, eyewear, glasses, object, person|
|🕶|DARK SUNGLASSES|U+1F576|&#1F576;|dark, eye, eyewear, glasses, object, sunglasses|
|👔|NECKTIE|U+1F454|&#1F454;|clothing, necktie, object, person|
|👕|T-SHIRT|U+1F455|&#1F455;|clothing, object, person, shirt, tshirt|
|👖|JEANS|U+1F456|&#1F456;|clothing, jeans, object, pants, person, trousers|
|👗|DRESS|U+1F457|&#1F457;|clothing, dress, object, person|
|👘|KIMONO|U+1F458|&#1F458;|clothing, kimono, object, person|
|👙|BIKINI|U+1F459|&#1F459;|bikini, clothing, object, person, swim|
|👚|WOMANS CLOTHES|U+1F45A|&#1F45A;|clothing, object, person, woman|
|👛|PURSE|U+1F45B|&#1F45B;|clothing, coin, object, person, purse|
|👜|HANDBAG|U+1F45C|&#1F45C;|bag, clothing, handbag, object, person|
|👝|POUCH|U+1F45D|&#1F45D;|bag, clothing, object, person, pouch|
|🛍|SHOPPING BAGS|U+1F6CD|&#1F6CD;|bag, hotel, object, shopping|
|🎒|SCHOOL SATCHEL|U+1F392|&#1F392;|activity, bag, education, object, satchel, school|
|👞|MANS SHOE|U+1F45E|&#1F45E;|clothing, man, object, person, shoe|
|👟|ATHLETIC SHOE|U+1F45F|&#1F45F;|athletic, clothing, object, person, shoe, sneaker|
|👠|HIGH-HEELED SHOE|U+1F460|&#1F460;|clothing, heel, object, person, shoe, woman|
|👡|WOMANS SANDAL|U+1F461|&#1F461;|clothing, object, person, sandal, shoe, woman|
|👢|WOMANS BOOTS|U+1F462|&#1F462;|boot, clothing, object, person, shoe, woman|
|👑|CROWN|U+1F451|&#1F451;|clothing, crown, king, object, person, queen|
|👒|WOMANS HAT|U+1F452|&#1F452;|clothing, hat, object, person, woman|
|🎩|TOP HAT|U+1F3A9|&#1F3A9;|activity, clothing, entertainment, hat, object, person, top, tophat|
|🎓|GRADUATION CAP|U+1F393|&#1F393;|activity, cap, celebration, clothing, education, graduation, hat, object|
|📿|PRAYER BEADS|U+1F4FF|&#1F4FF;|beads, clothing, necklace, object, person, prayer, religion|
|💄|LIPSTICK|U+1F484|&#1F484;|cosmetics, lipstick, makeup, object, person|
|💍|RING|U+1F48D|&#1F48D;|diamond, emotion, object, person, ring, romance|
|💎|GEM STONE|U+1F48E|&#1F48E;|diamond, emotion, gem, jewel, object, person, romance|
|🐵|MONKEY FACE|U+1F435|&#1F435;|animal, face, monkey, nature|
|🐒|MONKEY|U+1F412|&#1F412;|animal, monkey, nature|
|🐶|DOG FACE|U+1F436|&#1F436;|animal, dog, face, nature, pet|
|🐕|DOG|U+1F415|&#1F415;|animal, dog, nature, pet|
|🐩|POODLE|U+1F429|&#1F429;|animal, dog, nature, poodle|
|🐺|WOLF FACE|U+1F43A|&#1F43A;|animal, face, nature, wolf|
|🐱|CAT FACE|U+1F431|&#1F431;|animal, cat, face, nature, pet|
|🐈|CAT|U+1F408|&#1F408;|animal, cat, nature, pet|
|🦁|LION FACE|U+1F981|&#1F981;|animal, face, leo, lion, nature, zodiac|
|🐯|TIGER FACE|U+1F42F|&#1F42F;|animal, face, nature, tiger|
|🐅|TIGER|U+1F405|&#1F405;|animal, nature, tiger|
|🐆|LEOPARD|U+1F406|&#1F406;|animal, leopard, nature|
|🐴|HORSE FACE|U+1F434|&#1F434;|animal, face, horse, nature|
|🐎|HORSE|U+1F40E|&#1F40E;|animal, horse, nature, place, racehorse, racing|
|🦄|UNICORN FACE|U+1F984|&#1F984;|animal, face, nature, unicorn|
|🐮|COW FACE|U+1F42E|&#1F42E;|animal, cow, face, nature|
|🐂|OX|U+1F402|&#1F402;|animal, bull, nature, ox, taurus, zodiac|
|🐃|WATER BUFFALO|U+1F403|&#1F403;|animal, buffalo, nature, water|
|🐄|COW|U+1F404|&#1F404;|animal, cow, nature|
|🐷|PIG FACE|U+1F437|&#1F437;|animal, face, nature, pig|
|🐖|PIG|U+1F416|&#1F416;|animal, nature, pig, sow|
|🐗|BOAR|U+1F417|&#1F417;|animal, boar, nature, pig|
|🐽|PIG NOSE|U+1F43D|&#1F43D;|animal, face, nature, nose, pig|
|🐏|RAM|U+1F40F|&#1F40F;|animal, aries, nature, ram, sheep, zodiac|
|🐑|SHEEP|U+1F411|&#1F411;|animal, ewe, nature, sheep|
|🐐|GOAT|U+1F410|&#1F410;|animal, capricorn, goat, nature, zodiac|
|🐪|DROMEDARY CAMEL|U+1F42A|&#1F42A;|animal, camel, dromedary, hump, nature|
|🐫|BACTRIAN CAMEL|U+1F42B|&#1F42B;|animal, bactrian, camel, hump, nature|
|🐘|ELEPHANT|U+1F418|&#1F418;|animal, elephant, nature|
|🐭|MOUSE FACE|U+1F42D|&#1F42D;|animal, face, mouse, nature|
|🐁|MOUSE|U+1F401|&#1F401;|animal, mouse, nature|
|🐀|RAT|U+1F400|&#1F400;|animal, nature, rat|
|🐹|HAMSTER FACE|U+1F439|&#1F439;|animal, face, hamster, nature, pet|
|🐰|RABBIT FACE|U+1F430|&#1F430;|animal, bunny, face, nature, pet, rabbit|
|🐇|RABBIT|U+1F407|&#1F407;|animal, bunny, nature, pet, rabbit|
|🐿|CHIPMUNK|U+1F43F|&#1F43F;|animal, chipmunk, nature|
|🐻|BEAR FACE|U+1F43B|&#1F43B;|animal, bear, face, nature|
|🐨|KOALA|U+1F428|&#1F428;|animal, bear, koala, nature|
|🐼|PANDA FACE|U+1F43C|&#1F43C;|animal, face, nature, panda|
|🐾|PAW PRINTS|U+1F43E|&#1F43E;|animal, feet, nature, paw, print|
|🦃|TURKEY|U+1F983|&#1F983;|animal, nature, turkey|
|🐔|CHICKEN|U+1F414|&#1F414;|animal, chicken, nature|
|🐓|ROOSTER|U+1F413|&#1F413;|animal, nature, rooster|
|🐣|HATCHING CHICK|U+1F423|&#1F423;|animal, baby, chick, hatching, nature|
|🐤|BABY CHICK|U+1F424|&#1F424;|animal, baby, chick, nature|
|🐥|FRONT-FACING BABY CHICK|U+1F425|&#1F425;|animal, baby, chick, nature|
|🐦|BIRD|U+1F426|&#1F426;|animal, bird, nature|
|🐧|PENGUIN|U+1F427|&#1F427;|animal, nature, penguin|
|🕊|DOVE OF PEACE|U+1F54A|&#1F54A;|animal, bird, dove, fly, nature, peace|
|🐸|FROG FACE|U+1F438|&#1F438;|animal, face, frog, nature|
|🐊|CROCODILE|U+1F40A|&#1F40A;|animal, crocodile, nature|
|🐢|TURTLE|U+1F422|&#1F422;|animal, nature, turtle|
|🐍|SNAKE|U+1F40D|&#1F40D;|animal, bearer, nature, ophiuchus, serpent, snake, zodiac|
|🐲|DRAGON FACE|U+1F432|&#1F432;|animal, dragon, face, fairy tale, nature|
|🐉|DRAGON|U+1F409|&#1F409;|animal, dragon, fairy tale, nature|
|🐳|SPOUTING WHALE|U+1F433|&#1F433;|animal, face, nature, spouting, whale|
|🐋|WHALE|U+1F40B|&#1F40B;|animal, nature, whale|
|🐬|DOLPHIN|U+1F42C|&#1F42C;|animal, dolphin, flipper, nature|
|🐟|FISH|U+1F41F|&#1F41F;|animal, fish, nature, pisces, zodiac|
|🐠|TROPICAL FISH|U+1F420|&#1F420;|animal, fish, nature, tropical|
|🐡|BLOWFISH|U+1F421|&#1F421;|animal, blowfish, fish, nature|
|🐙|OCTOPUS|U+1F419|&#1F419;|animal, nature, octopus|
|🐚|SPIRAL SHELL|U+1F41A|&#1F41A;|animal, nature, shell, spiral|
|🦀|CRAB|U+1F980|&#1F980;|animal, cancer, crab, nature, zodiac|
|🐌|SNAIL|U+1F40C|&#1F40C;|animal, nature, snail|
|🐛|BUG|U+1F41B|&#1F41B;|animal, bug, insect, nature|
|🐜|ANT|U+1F41C|&#1F41C;|animal, ant, insect, nature|
|🐝|HONEYBEE|U+1F41D|&#1F41D;|animal, bee, honeybee, insect, nature|
|🐞|LADY BEETLE|U+1F41E|&#1F41E;|animal, beetle, insect, lady beetle, ladybird, ladybug, nature|
|🕷|SPIDER|U+1F577|&#1F577;|animal, insect, object, spider|
|🕸|SPIDER WEB|U+1F578|&#1F578;|animal, object, spider, web|
|🦂|SCORPION|U+1F982|&#1F982;|animal, nature, scorpio, scorpion, scorpius, zodiac|
|💐|BOUQUET|U+1F490|&#1F490;|bouquet, flower, nature, object, place, plant, romance|
|🌸|CHERRY BLOSSOM|U+1F338|&#1F338;|blossom, cherry, flower, nature, plant|
|💮|WHITE FLOWER|U+1F4AE|&#1F4AE;|flower, object, symbol|
|🏵|ROSETTE|U+1F3F5|&#1F3F5;|nature, plant, rosette|
|🌹|ROSE|U+1F339|&#1F339;|flower, nature, plant, rose|
|🌺|HIBISCUS|U+1F33A|&#1F33A;|flower, hibiscus, nature, plant|
|🌻|SUNFLOWER|U+1F33B|&#1F33B;|flower, nature, plant, sun, sunflower|
|🌼|BLOSSOM|U+1F33C|&#1F33C;|blossom, flower, nature, plant|
|🌷|TULIP|U+1F337|&#1F337;|flower, nature, plant, tulip|
|🌱|SEEDLING|U+1F331|&#1F331;|nature, plant, seedling, young|
|🌲|EVERGREEN TREE|U+1F332|&#1F332;|evergreen, nature, plant, tree|
|🌳|DECIDUOUS TREE|U+1F333|&#1F333;|deciduous, nature, plant, shedding, tree|
|🌴|PALM TREE|U+1F334|&#1F334;|nature, palm, plant, tree|
|🌵|CACTUS|U+1F335|&#1F335;|cactus, nature, plant|
|🌾|EAR OF RICE|U+1F33E|&#1F33E;|ear, nature, plant, rice|
|🌿|HERB|U+1F33F|&#1F33F;|herb, leaf, nature, plant|
|☘|SHAMROCK|U+2618|&#2618;|nature, plant, shamrock|
|🍀|FOUR LEAF CLOVER|U+1F340|&#1F340;|4, clover, four, leaf, nature, plant|
|🍁|MAPLE LEAF|U+1F341|&#1F341;|falling, leaf, maple, nature, plant|
|🍂|FALLEN LEAF|U+1F342|&#1F342;|falling, leaf, nature, plant|
|🍃|LEAF FLUTTERING IN WIND|U+1F343|&#1F343;|blow, flutter, leaf, nature, plant, wind|
|🍇|GRAPES|U+1F347|&#1F347;|food, fruit, grape, nature, object, plant|
|🍈|MELON|U+1F348|&#1F348;|food, fruit, melon, nature, object, plant|
|🍉|WATERMELON|U+1F349|&#1F349;|food, fruit, nature, object, plant, watermelon|
|🍊|TANGERINE|U+1F34A|&#1F34A;|food, fruit, nature, object, orange, plant, tangerine|
|🍋|LEMON|U+1F34B|&#1F34B;|citrus, food, fruit, lemon, nature, object, plant|
|🍌|BANANA|U+1F34C|&#1F34C;|banana, food, fruit, nature, object, plant|
|🍍|PINEAPPLE|U+1F34D|&#1F34D;|food, fruit, nature, object, pineapple, plant|
|🍎|RED APPLE|U+1F34E|&#1F34E;|apple, food, fruit, nature, object, plant, red|
|🍏|GREEN APPLE|U+1F34F|&#1F34F;|apple, food, fruit, green, nature, object, plant|
|🍐|PEAR|U+1F350|&#1F350;|food, fruit, nature, object, pear, plant|
|🍑|PEACH|U+1F351|&#1F351;|food, fruit, nature, object, peach, plant|
|🍒|CHERRIES|U+1F352|&#1F352;|cherry, food, fruit, nature, object, plant|
|🍓|STRAWBERRY|U+1F353|&#1F353;|berry, food, fruit, nature, object, plant, strawberry|
|🍅|TOMATO|U+1F345|&#1F345;|food, nature, object, plant, tomato, vegetable|
|🍆|AUBERGINE|U+1F346|&#1F346;|aubergine, eggplant, food, nature, object, plant, vegetable|
|🌽|EAR OF MAIZE|U+1F33D|&#1F33D;|corn, ear, maize, maze, nature, object, plant|
|🌶|HOT PEPPER|U+1F336|&#1F336;|food, hot, nature, pepper, plant|
|🍄|MUSHROOM|U+1F344|&#1F344;|mushroom, nature, plant|
|🌰|CHESTNUT|U+1F330|&#1F330;|chestnut, nature, plant|
|🍞|BREAD|U+1F35E|&#1F35E;|bread, food, loaf, nature, object|
|🧀|CHEESE WEDGE|U+1F9C0|&#1F9C0;|cheese, food, nature|
|🍖|MEAT ON BONE|U+1F356|&#1F356;|bone, food, meat, nature, object|
|🍗|POULTRY LEG|U+1F357|&#1F357;|bone, chicken, food, leg, nature, object, poultry|
|🍔|HAMBURGER|U+1F354|&#1F354;|burger, food, hamburger, nature, object|
|🍟|FRENCH FRIES|U+1F35F|&#1F35F;|food, french, fries, nature, object|
|🍕|SLICE OF PIZZA|U+1F355|&#1F355;|cheese, food, nature, object, pizza, slice|
|🌭|HOT DOG|U+1F32D|&#1F32D;|food, frankfurter, hot dog, hotdog, nature, sausage|
|🌮|TACO|U+1F32E|&#1F32E;|food, mexican, nature, taco|
|🌯|BURRITO|U+1F32F|&#1F32F;|burrito, food, mexican, nature|
|🍳|COOKING|U+1F373|&#1F373;|cooking, egg, food, frying, nature, object, pan|
|🍲|POT OF FOOD|U+1F372|&#1F372;|food, nature, object, pot, stew|
|🍿|POPCORN|U+1F37F|&#1F37F;|food, nature, popcorn|
|🍱|BENTO BOX|U+1F371|&#1F371;|bento, box, food, nature, object|
|🍘|RICE CRACKER|U+1F358|&#1F358;|cracker, food, nature, object, rice|
|🍙|RICE BALL|U+1F359|&#1F359;|ball, food, japanese, nature, object, rice|
|🍚|COOKED RICE|U+1F35A|&#1F35A;|cooked, food, nature, object, rice|
|🍛|CURRY AND RICE|U+1F35B|&#1F35B;|curry, food, nature, object, rice|
|🍜|STEAMING BOWL|U+1F35C|&#1F35C;|bowl, food, nature, noodle, object, ramen, steaming|
|🍝|SPAGHETTI|U+1F35D|&#1F35D;|food, nature, object, pasta, spaghetti|
|🍠|ROASTED SWEET POTATO|U+1F360|&#1F360;|food, nature, object, potato, roasted, sweet|
|🍢|ODEN|U+1F362|&#1F362;|food, kebab, nature, object, oden, seafood, skewer, stick|
|🍣|SUSHI|U+1F363|&#1F363;|food, nature, object, sushi|
|🍤|FRIED SHRIMP|U+1F364|&#1F364;|food, fried, nature, object, prawn, shrimp, tempura|
|🍥|FISH CAKE WITH SWIRL DESIGN|U+1F365|&#1F365;|cake, fish, food, nature, object, pastry, swirl|
|🍡|DANGO|U+1F361|&#1F361;|dango, dessert, food, japanese, nature, object, skewer, stick, sweet|
|🍦|SOFT ICE CREAM|U+1F366|&#1F366;|cream, dessert, food, ice, icecream, nature, object, soft, sweet|
|🍧|SHAVED ICE|U+1F367|&#1F367;|dessert, food, ice, nature, object, shaved, sweet|
|🍨|ICE CREAM|U+1F368|&#1F368;|cream, dessert, food, ice, nature, object, sweet|
|🍩|DOUGHNUT|U+1F369|&#1F369;|dessert, donut, doughnut, food, nature, object, sweet|
|🍪|COOKIE|U+1F36A|&#1F36A;|cookie, dessert, food, nature, object, sweet|
|🎂|BIRTHDAY CAKE|U+1F382|&#1F382;|birthday, cake, celebration, dessert, food, object, pastry, sweet|
|🍰|SHORTCAKE|U+1F370|&#1F370;|cake, dessert, food, nature, object, pastry, shortcake, slice, sweet|
|🍫|CHOCOLATE BAR|U+1F36B|&#1F36B;|bar, chocolate, dessert, food, nature, object, sweet|
|🍬|CANDY|U+1F36C|&#1F36C;|candy, dessert, food, nature, object, sweet|
|🍭|LOLLIPOP|U+1F36D|&#1F36D;|candy, dessert, food, lollipop, nature, object, sweet|
|🍮|CUSTARD|U+1F36E|&#1F36E;|custard, dessert, food, nature, object, pudding, sweet|
|🍯|HONEY POT|U+1F36F|&#1F36F;|food, honey, honeypot, nature, object, pot, sweet|
|🍼|BABY BOTTLE|U+1F37C|&#1F37C;|baby, bottle, drink, milk, nature, object|
|☕|HOT BEVERAGE|U+2615|&#2615;|beverage, coffee, drink, hot, nature, object, steaming, tea|
|🍵|TEACUP WITHOUT HANDLE|U+1F375|&#1F375;|beverage, cup, drink, nature, object, tea, teacup|
|🍶|SAKE BOTTLE AND CUP|U+1F376|&#1F376;|bar, beverage, bottle, cup, drink, nature, object, sake|
|🍾|BOTTLE WITH POPPING CORK|U+1F37E|&#1F37E;|bar, bottle, cork, drink, nature, popping|
|🍷|WINE GLASS|U+1F377|&#1F377;|bar, beverage, drink, glass, nature, object, wine|
|🍸|COCKTAIL GLASS|U+1F378|&#1F378;|bar, cocktail, drink, glass, nature, object|
|🍹|TROPICAL DRINK|U+1F379|&#1F379;|bar, drink, nature, object, tropical|
|🍺|BEER MUG|U+1F37A|&#1F37A;|bar, beer, drink, mug, nature, object|
|🍻|CLINKING BEER MUGS|U+1F37B|&#1F37B;|bar, beer, clink, drink, mug, nature, object|
|🍽|FORK AND KNIFE WITH PLATE|U+1F37D|&#1F37D;|cooking, food, fork, knife, object, place, plate|
|🍴|FORK AND KNIFE|U+1F374|&#1F374;|cooking, food, fork, knife, nature, object|
|🔪|HOCHO|U+1F52A|&#1F52A;|cooking, hocho, knife, object, tool, weapon|
|🏺|AMPHORA|U+1F3FA|&#1F3FA;|amphora, aquarius, cooking, drink, jug, nature, tool, weapon, zodiac|
|🌍|EARTH GLOBE EUROPE-AFRICA|U+1F30D|&#1F30D;|africa, earth, europe, globe, nature, place, world|
|🌎|EARTH GLOBE AMERICAS|U+1F30E|&#1F30E;|americas, earth, globe, nature, place, world|
|🌏|EARTH GLOBE ASIA-AUSTRALIA|U+1F30F|&#1F30F;|asia, australia, earth, globe, nature, place, world|
|🌐|GLOBE WITH MERIDIANS|U+1F310|&#1F310;|earth, globe, meridians, nature, place, world|
|🗺|WORLD MAP|U+1F5FA|&#1F5FA;|map, place, world|
|🗾|SILHOUETTE OF JAPAN|U+1F5FE|&#1F5FE;|japan, map, place|
|🏔|SNOW CAPPED MOUNTAIN|U+1F3D4|&#1F3D4;|cold, mountain, nature, place, snow|
|⛰|MOUNTAIN|U+26F0|&#26F0;|mountain, place|
|🌋|VOLCANO|U+1F30B|&#1F30B;|eruption, mountain, nature, place, volcano, weather|
|🗻|MOUNT FUJI|U+1F5FB|&#1F5FB;|fuji, mountain, nature, place|
|🏕|CAMPING|U+1F3D5|&#1F3D5;|camping, nature, place|
|🏖|BEACH WITH UMBRELLA|U+1F3D6|&#1F3D6;|beach, nature, place, umbrella|
|🏜|DESERT|U+1F3DC|&#1F3DC;|desert, nature, place|
|🏝|DESERT ISLAND|U+1F3DD|&#1F3DD;|desert, island, nature, place|
|🏞|NATIONAL PARK|U+1F3DE|&#1F3DE;|national park, nature, park, place|
|🏟|STADIUM|U+1F3DF|&#1F3DF;|place, stadium|
|🏛|CLASSICAL BUILDING|U+1F3DB|&#1F3DB;|building, classical, place|
|🏗|BUILDING CONSTRUCTION|U+1F3D7|&#1F3D7;|building, construction, place|
|🏘|HOUSE BUILDINGS|U+1F3D8|&#1F3D8;|building, house, place|
|🏙|CITYSCAPE|U+1F3D9|&#1F3D9;|building, city, place|
|🏚|DERELICT HOUSE BUILDING|U+1F3DA|&#1F3DA;|building, derelict, house, place|
|🏠|HOUSE BUILDING|U+1F3E0|&#1F3E0;|building, home, house, place|
|🏡|HOUSE WITH GARDEN|U+1F3E1|&#1F3E1;|building, garden, home, house, place|
|🏢|OFFICE BUILDING|U+1F3E2|&#1F3E2;|building, office, place|
|🏣|JAPANESE POST OFFICE|U+1F3E3|&#1F3E3;|building, japanese, office, place, post|
|🏤|EUROPEAN POST OFFICE|U+1F3E4|&#1F3E4;|building, european, office, place, post|
|🏥|HOSPITAL|U+1F3E5|&#1F3E5;|building, doctor, hospital, medicine, place|
|🏦|BANK|U+1F3E6|&#1F3E6;|bank, building, place|
|🏨|HOTEL|U+1F3E8|&#1F3E8;|building, hotel, place|
|🏩|LOVE HOTEL|U+1F3E9|&#1F3E9;|building, hotel, love, place|
|🏪|CONVENIENCE STORE|U+1F3EA|&#1F3EA;|building, convenience, place, store|
|🏫|SCHOOL|U+1F3EB|&#1F3EB;|building, education, place, school|
|🏬|DEPARTMENT STORE|U+1F3EC|&#1F3EC;|building, department, place, store|
|🏭|FACTORY|U+1F3ED|&#1F3ED;|building, factory, place|
|🏯|JAPANESE CASTLE|U+1F3EF|&#1F3EF;|building, castle, japanese, place|
|🏰|EUROPEAN CASTLE|U+1F3F0|&#1F3F0;|building, castle, european, place|
|💒|WEDDING|U+1F492|&#1F492;|activity, chapel, place, romance, wedding|
|🗼|TOKYO TOWER|U+1F5FC|&#1F5FC;|place, tokyo, tower|
|🗽|STATUE OF LIBERTY|U+1F5FD|&#1F5FD;|liberty, place, statue|
|⛪|CHURCH|U+26EA|&#26EA;|building, christian, church, cross, place, religion|
|🕌|MOSQUE|U+1F54C|&#1F54C;|islam, mosque, muslim, place, religion|
|🕍|SYNAGOGUE|U+1F54D|&#1F54D;|jew, jewish, place, religion, synagogue, temple|
|⛩|SHINTO SHRINE|U+26E9|&#26E9;|religion, shinto, shrine, symbol|
|🕋|KAABA|U+1F54B|&#1F54B;|islam, kaaba, muslim, place, religion|
|⛲|FOUNTAIN|U+26F2|&#26F2;|fountain, object, place|
|⛺|TENT|U+26FA|&#26FA;|camping, object, place, tent|
|🌁|FOGGY|U+1F301|&#1F301;|fog, nature, place, weather|
|🌃|NIGHT WITH STARS|U+1F303|&#1F303;|nature, night, place, star, weather|
|🌄|SUNRISE OVER MOUNTAINS|U+1F304|&#1F304;|morning, mountain, nature, place, sun, sunrise, time, weather|
|🌅|SUNRISE|U+1F305|&#1F305;|morning, nature, place, sun, sunrise, time, weather|
|🌆|CITYSCAPE AT DUSK|U+1F306|&#1F306;|building, city, dusk, evening, landscape, nature, place, sun, sunset, time, weather|
|🌇|SUNSET OVER BUILDINGS|U+1F307|&#1F307;|building, dusk, nature, place, sun, sunset, time, weather|
|🌉|BRIDGE AT NIGHT|U+1F309|&#1F309;|bridge, nature, night, place, weather|
|♨|HOT SPRINGS|U+2668|&#2668;|hot, hotsprings, place, springs, steaming|
|🌌|MILKY WAY|U+1F30C|&#1F30C;|milky way, nature, place, space, weather|
|🎠|CAROUSEL HORSE|U+1F3A0|&#1F3A0;|activity, carousel, entertainment, horse, place|
|🎡|FERRIS WHEEL|U+1F3A1|&#1F3A1;|activity, amusement park, entertainment, ferris, place, wheel|
|🎢|ROLLER COASTER|U+1F3A2|&#1F3A2;|activity, amusement park, coaster, entertainment, place, roller|
|💈|BARBER POLE|U+1F488|&#1F488;|barber, haircut, place, pole|
|🎪|CIRCUS TENT|U+1F3AA|&#1F3AA;|activity, circus, entertainment, place, tent|
|🎭|PERFORMING ARTS|U+1F3AD|&#1F3AD;|activity, art, entertainment, mask, object, performing, place, theater, theatre|
|🖼|FRAME WITH PICTURE|U+1F5BC|&#1F5BC;|art, frame, museum, object, office, painting, picture|
|🎨|ARTIST PALETTE|U+1F3A8|&#1F3A8;|activity, art, entertainment, museum, object, painting, palette|
|🎰|SLOT MACHINE|U+1F3B0|&#1F3B0;|activity, game, object, place, slot|
|🚂|STEAM LOCOMOTIVE|U+1F682|&#1F682;|engine, locomotive, place, railway, steam, train, travel, vehicle|
|🚃|RAILWAY CAR|U+1F683|&#1F683;|car, electric, place, railway, train, tram, travel, trolleybus, vehicle|
|🚄|HIGH-SPEED TRAIN|U+1F684|&#1F684;|place, railway, shinkansen, speed, train, travel, vehicle|
|🚅|HIGH-SPEED TRAIN WITH BULLET NOSE|U+1F685|&#1F685;|bullet, place, railway, shinkansen, speed, train, travel, vehicle|
|🚆|TRAIN|U+1F686|&#1F686;|place, railway, train, travel, vehicle|
|🚇|METRO|U+1F687|&#1F687;|metro, place, subway, travel, vehicle|
|🚈|LIGHT RAIL|U+1F688|&#1F688;|place, railway, travel, vehicle|
|🚉|STATION|U+1F689|&#1F689;|place, railway, station, train, travel, vehicle|
|🚊|TRAM|U+1F68A|&#1F68A;|place, tram, travel, trolleybus, vehicle|
|🚝|MONORAIL|U+1F69D|&#1F69D;|monorail, place, travel, vehicle|
|🚞|MOUNTAIN RAILWAY|U+1F69E|&#1F69E;|car, mountain, place, railway, travel, vehicle|
|🚋|TRAM CAR|U+1F68B|&#1F68B;|car, place, tram, travel, trolleybus, vehicle|
|🚌|BUS|U+1F68C|&#1F68C;|bus, place, travel, vehicle|
|🚍|ONCOMING BUS|U+1F68D|&#1F68D;|bus, oncoming, place, travel, vehicle|
|🚎|TROLLEYBUS|U+1F68E|&#1F68E;|bus, place, tram, travel, trolley, trolleybus, vehicle|
|🚏|BUS STOP|U+1F68F|&#1F68F;|bus, busstop, place, stop, travel|
|🚐|MINIBUS|U+1F690|&#1F690;|bus, minibus, place, travel, vehicle|
|🚑|AMBULANCE|U+1F691|&#1F691;|ambulance, place, travel, vehicle|
|🚒|FIRE ENGINE|U+1F692|&#1F692;|engine, fire, place, travel, truck, vehicle|
|🚓|POLICE CAR|U+1F693|&#1F693;|car, patrol, place, police, travel, vehicle|
|🚔|ONCOMING POLICE CAR|U+1F694|&#1F694;|car, oncoming, place, police, travel, vehicle|
|🚕|TAXI|U+1F695|&#1F695;|place, taxi, travel, vehicle|
|🚖|ONCOMING TAXI|U+1F696|&#1F696;|oncoming, place, taxi, travel, vehicle|
|🚗|AUTOMOBILE|U+1F697|&#1F697;|automobile, car, place, travel, vehicle|
|🚘|ONCOMING AUTOMOBILE|U+1F698|&#1F698;|automobile, car, oncoming, place, travel, vehicle|
|🚙|RECREATIONAL VEHICLE|U+1F699|&#1F699;|place, recreational, rv, travel, vehicle|
|🚚|DELIVERY TRUCK|U+1F69A|&#1F69A;|delivery, place, travel, truck, vehicle|
|🚛|ARTICULATED LORRY|U+1F69B|&#1F69B;|lorry, place, semi, travel, truck, vehicle|
|🚜|TRACTOR|U+1F69C|&#1F69C;|place, tractor, travel, vehicle|
|🚲|BICYCLE|U+1F6B2|&#1F6B2;|bicycle, bike, place, sport, travel, vehicle|
|⛽|FUEL PUMP|U+26FD|&#26FD;|fuel, fuelpump, gas, place, pump, station, travel|
|🛣|MOTORWAY|U+1F6E3|&#1F6E3;|highway, motorway, place, road, travel|
|🛤|RAILWAY TRACK|U+1F6E4|&#1F6E4;|place, railway, train, travel|
|🚨|POLICE CARS REVOLVING LIGHT|U+1F6A8|&#1F6A8;|beacon, car, light, place, police, revolving, travel, vehicle|
|🚥|HORIZONTAL TRAFFIC LIGHT|U+1F6A5|&#1F6A5;|light, place, signal, traffic, travel|
|🚦|VERTICAL TRAFFIC LIGHT|U+1F6A6|&#1F6A6;|light, place, signal, traffic, travel|
|🚧|CONSTRUCTION SIGN|U+1F6A7|&#1F6A7;|barrier, construction, place, travel|
|⚓|ANCHOR|U+2693|&#2693;|anchor, place, ship, tool, travel|
|⛵|SAILBOAT|U+26F5|&#26F5;|boat, place, resort, sailboat, sea, travel, vehicle, yacht|
|🚣|ROWBOAT|U+1F6A3|&#1F6A3;|boat, place, rowboat, travel, vehicle|
|🚣🏻|ROWBOAT, TYPE-1-2|U+1F6A3 U+1F3FB|&#1F6A3;&#1F3FB;||
|🚣🏼|ROWBOAT, TYPE-3|U+1F6A3 U+1F3FC|&#1F6A3;&#1F3FC;||
|🚣🏽|ROWBOAT, TYPE-4|U+1F6A3 U+1F3FD|&#1F6A3;&#1F3FD;||
|🚣🏾|ROWBOAT, TYPE-5|U+1F6A3 U+1F3FE|&#1F6A3;&#1F3FE;||
|🚣🏿|ROWBOAT, TYPE-6|U+1F6A3 U+1F3FF|&#1F6A3;&#1F3FF;||
|🚤|SPEEDBOAT|U+1F6A4|&#1F6A4;|boat, place, speedboat, travel, vehicle|
|🛳|PASSENGER SHIP|U+1F6F3|&#1F6F3;|passenger, place, ship, travel, vehicle|
|⛴|FERRY|U+26F4|&#26F4;|boat, ferry, place, travel|
|🛥|MOTOR BOAT|U+1F6E5|&#1F6E5;|boat, motorboat, place, travel, vehicle|
|🚢|SHIP|U+1F6A2|&#1F6A2;|place, ship, travel, vehicle|
|✈|AIRPLANE|U+2708|&#2708;|airplane, place, travel, vehicle|
|🛩|SMALL AIRPLANE|U+1F6E9|&#1F6E9;|airplane, place, travel, vehicle|
|🛫|AIRPLANE DEPARTURE|U+1F6EB|&#1F6EB;|airplane, check-in, departure, departures, place, travel, vehicle|
|🛬|AIRPLANE ARRIVING|U+1F6EC|&#1F6EC;|airplane, arrivals, arriving, landing, place, travel, vehicle|
|💺|SEAT|U+1F4BA|&#1F4BA;|chair, object, office, place, seat, travel|
|🚁|HELICOPTER|U+1F681|&#1F681;|helicopter, place, travel, vehicle|
|🚟|SUSPENSION RAILWAY|U+1F69F|&#1F69F;|place, railway, suspension, travel, vehicle|
|🚠|MOUNTAIN CABLEWAY|U+1F6A0|&#1F6A0;|cable, gondola, mountain, place, travel, vehicle|
|🚡|AERIAL TRAMWAY|U+1F6A1|&#1F6A1;|aerial, cable, car, gondola, place, ropeway, tramway, travel, vehicle|
|🚀|ROCKET|U+1F680|&#1F680;|place, rocket, space, travel, vehicle|
|🛰|SATELLITE|U+1F6F0|&#1F6F0;|place, satellite, space, vehicle|
|🛎|BELLHOP BELL|U+1F6CE|&#1F6CE;|bell, bellhop, hotel, object|
|🚪|DOOR|U+1F6AA|&#1F6AA;|door, object, travel|
|🛌|SLEEPING ACCOMMODATION|U+1F6CC|&#1F6CC;|hotel, object, sleep|
|🛏|BED|U+1F6CF|&#1F6CF;|bed, hotel, object, sleep|
|🛋|COUCH AND LAMP|U+1F6CB|&#1F6CB;|couch, hotel, lamp, object|
|🚽|TOILET|U+1F6BD|&#1F6BD;|object, place, toilet, travel|
|🚿|SHOWER|U+1F6BF|&#1F6BF;|object, place, shower, travel, water|
|🛀|BATH|U+1F6C0|&#1F6C0;|bath, bathtub, object, place, travel|
|🛀🏻|BATH, TYPE-1-2|U+1F6C0 U+1F3FB|&#1F6C0;&#1F3FB;||
|🛀🏼|BATH, TYPE-3|U+1F6C0 U+1F3FC|&#1F6C0;&#1F3FC;||
|🛀🏽|BATH, TYPE-4|U+1F6C0 U+1F3FD|&#1F6C0;&#1F3FD;||
|🛀🏾|BATH, TYPE-5|U+1F6C0 U+1F3FE|&#1F6C0;&#1F3FE;||
|🛀🏿|BATH, TYPE-6|U+1F6C0 U+1F3FF|&#1F6C0;&#1F3FF;||
|🛁|BATHTUB|U+1F6C1|&#1F6C1;|bath, bathtub, object, place, travel|
|⌛|HOURGLASS|U+231B|&#231B;|hourglass, object, sand, time, timer|
|⏳|HOURGLASS WITH FLOWING SAND|U+23F3|&#23F3;|hourglass, object, sand, time, timer|
|⌚|WATCH|U+231A|&#231A;|clock, object, time, watch|
|⏰|ALARM CLOCK|U+23F0|&#23F0;|alarm, clock, object, time|
|⏱|STOPWATCH|U+23F1|&#23F1;|clock, object, stopwatch, time|
|⏲|TIMER CLOCK|U+23F2|&#23F2;|clock, object, time, timer|
|🕰|MANTELPIECE CLOCK|U+1F570|&#1F570;|clock, object|
|🕛|CLOCK FACE TWELVE OCLOCK|U+1F55B|&#1F55B;|00, 12, 12:00, clock, o�clock, symbol, time, twelve|
|🕧|CLOCK FACE TWELVE-THIRTY|U+1F567|&#1F567;|12, 12:30, 30, clock, symbol, thirty, time, twelve|
|🕐|CLOCK FACE ONE OCLOCK|U+1F550|&#1F550;|00, 1, 1:00, clock, o�clock, one, symbol, time|
|🕜|CLOCK FACE ONE-THIRTY|U+1F55C|&#1F55C;|1, 1:30, 30, clock, one, symbol, thirty, time|
|🕑|CLOCK FACE TWO OCLOCK|U+1F551|&#1F551;|00, 2, 2:00, clock, o�clock, symbol, time, two|
|🕝|CLOCK FACE TWO-THIRTY|U+1F55D|&#1F55D;|2, 2:30, 30, clock, symbol, thirty, time, two|
|🕒|CLOCK FACE THREE OCLOCK|U+1F552|&#1F552;|00, 3, 3:00, clock, o�clock, symbol, three, time|
|🕞|CLOCK FACE THREE-THIRTY|U+1F55E|&#1F55E;|3, 3:30, 30, clock, symbol, thirty, three, time|
|🕓|CLOCK FACE FOUR OCLOCK|U+1F553|&#1F553;|00, 4, 4:00, clock, four, o�clock, symbol, time|
|🕟|CLOCK FACE FOUR-THIRTY|U+1F55F|&#1F55F;|30, 4, 4:30, clock, four, symbol, thirty, time|
|🕔|CLOCK FACE FIVE OCLOCK|U+1F554|&#1F554;|00, 5, 5:00, clock, five, o�clock, symbol, time|
|🕠|CLOCK FACE FIVE-THIRTY|U+1F560|&#1F560;|30, 5, 5:30, clock, five, symbol, thirty, time|
|🕕|CLOCK FACE SIX OCLOCK|U+1F555|&#1F555;|00, 6, 6:00, clock, o�clock, six, symbol, time|
|🕡|CLOCK FACE SIX-THIRTY|U+1F561|&#1F561;|30, 6, 6:30, clock, six, symbol, thirty, time|
|🕖|CLOCK FACE SEVEN OCLOCK|U+1F556|&#1F556;|00, 7, 7:00, clock, o�clock, seven, symbol, time|
|🕢|CLOCK FACE SEVEN-THIRTY|U+1F562|&#1F562;|30, 7, 7:30, clock, seven, symbol, thirty, time|
|🕗|CLOCK FACE EIGHT OCLOCK|U+1F557|&#1F557;|00, 8, 8:00, clock, eight, o�clock, symbol, time|
|🕣|CLOCK FACE EIGHT-THIRTY|U+1F563|&#1F563;|30, 8, 8:30, clock, eight, symbol, thirty, time|
|🕘|CLOCK FACE NINE OCLOCK|U+1F558|&#1F558;|00, 9, 9:00, clock, nine, o�clock, symbol, time|
|🕤|CLOCK FACE NINE-THIRTY|U+1F564|&#1F564;|30, 9, 9:30, clock, nine, symbol, thirty, time|
|🕙|CLOCK FACE TEN OCLOCK|U+1F559|&#1F559;|00, 10, 10:00, clock, o�clock, symbol, ten, time|
|🕥|CLOCK FACE TEN-THIRTY|U+1F565|&#1F565;|10, 10:30, 30, clock, symbol, ten, thirty, time|
|🕚|CLOCK FACE ELEVEN OCLOCK|U+1F55A|&#1F55A;|00, 11, 11:00, clock, eleven, o�clock, symbol, time|
|🕦|CLOCK FACE ELEVEN-THIRTY|U+1F566|&#1F566;|11, 11:30, 30, clock, eleven, symbol, thirty, time|
|🌑|NEW MOON SYMBOL|U+1F311|&#1F311;|dark, moon, nature, place, space, time, weather|
|🌒|WAXING CRESCENT MOON SYMBOL|U+1F312|&#1F312;|crescent, moon, nature, place, space, time, waxing, weather|
|🌓|FIRST QUARTER MOON SYMBOL|U+1F313|&#1F313;|moon, nature, place, quarter, space, time, weather|
|🌔|WAXING GIBBOUS MOON SYMBOL|U+1F314|&#1F314;|gibbous, moon, nature, place, space, time, waxing, weather|
|🌕|FULL MOON SYMBOL|U+1F315|&#1F315;|full, moon, nature, place, space, time, weather|
|🌖|WANING GIBBOUS MOON SYMBOL|U+1F316|&#1F316;|gibbous, moon, nature, place, space, time, waning, weather|
|🌗|LAST QUARTER MOON SYMBOL|U+1F317|&#1F317;|moon, nature, place, quarter, space, time, weather|
|🌘|WANING CRESCENT MOON SYMBOL|U+1F318|&#1F318;|crescent, moon, nature, place, space, time, waning, weather|
|🌙|CRESCENT MOON|U+1F319|&#1F319;|crescent, moon, nature, place, space, time, weather|
|🌚|NEW MOON WITH FACE|U+1F31A|&#1F31A;|face, moon, nature, place, space, time, weather|
|🌛|FIRST QUARTER MOON WITH FACE|U+1F31B|&#1F31B;|face, moon, nature, place, quarter, space, weather|
|🌜|LAST QUARTER MOON WITH FACE|U+1F31C|&#1F31C;|face, moon, nature, place, quarter, space, weather|
|🌡|THERMOMETER|U+1F321|&#1F321;|nature, thermometer, weather|
|☀|BLACK SUN WITH RAYS|U+2600|&#2600;|bright, nature, rays, space, sun, sunny, weather|
|🌝|FULL MOON WITH FACE|U+1F31D|&#1F31D;|bright, face, full, moon, nature, place, space, weather|
|🌞|SUN WITH FACE|U+1F31E|&#1F31E;|bright, face, nature, place, space, sun, weather|
|⭐|WHITE MEDIUM STAR|U+2B50|&#2B50;|nature, place, star|
|🌟|GLOWING STAR|U+1F31F|&#1F31F;|glittery, glow, object, place, shining, sparkle, star|
|🌠|SHOOTING STAR|U+1F320|&#1F320;|activity, falling, nature, place, shooting, space, star|
|☁|CLOUD|U+2601|&#2601;|cloud, nature, weather|
|⛅|SUN BEHIND CLOUD|U+26C5|&#26C5;|cloud, nature, sun, weather|
|⛈|THUNDER CLOUD AND RAIN|U+26C8|&#26C8;|cloud, nature, rain, thunder, weather|
|🌤|WHITE SUN WITH SMALL CLOUD|U+1F324|&#1F324;|cloud, nature, sun, weather|
|🌥|WHITE SUN BEHIND CLOUD|U+1F325|&#1F325;|cloud, nature, sun, weather|
|🌦|WHITE SUN BEHIND CLOUD WITH RAIN|U+1F326|&#1F326;|cloud, nature, rain, sun, weather|
|🌧|CLOUD WITH RAIN|U+1F327|&#1F327;|cloud, nature, rain, weather|
|🌨|CLOUD WITH SNOW|U+1F328|&#1F328;|cloud, cold, nature, snow, weather|
|🌩|CLOUD WITH LIGHTNING|U+1F329|&#1F329;|cloud, lightning, nature, weather|
|🌪|CLOUD WITH TORNADO|U+1F32A|&#1F32A;|cloud, nature, tornado, weather, whirlwind|
|🌫|FOG|U+1F32B|&#1F32B;|cloud, fog, nature, weather|
|🌬|WIND BLOWING FACE|U+1F32C|&#1F32C;|blow, cloud, face, nature, weather, wind|
|🌀|CYCLONE|U+1F300|&#1F300;|cyclone, dizzy, nature, twister, typhoon, weather|
|🌈|RAINBOW|U+1F308|&#1F308;|nature, rain, rainbow, weather|
|🌂|CLOSED UMBRELLA|U+1F302|&#1F302;|clothing, nature, person, rain, umbrella, weather|
|☂|UMBRELLA|U+2602|&#2602;|clothing, nature, rain, umbrella, weather|
|☔|UMBRELLA WITH RAIN DROPS|U+2614|&#2614;|clothing, drop, nature, rain, umbrella, weather|
|⛱|UMBRELLA ON GROUND|U+26F1|&#26F1;|nature, rain, sun, travel, umbrella, weather|
|⚡|HIGH VOLTAGE SIGN|U+26A1|&#26A1;|danger, electric, electricity, lightning, nature, symbol, voltage, zap|
|❄|SNOWFLAKE|U+2744|&#2744;|cold, nature, snow, snowflake, weather|
|☃|SNOWMAN|U+2603|&#2603;|cold, nature, snow, snowman, weather|
|⛄|SNOWMAN WITHOUT SNOW|U+26C4|&#26C4;|cold, nature, snow, snowman, weather|
|☄|COMET|U+2604|&#2604;|comet, object, space|
|🔥|FIRE|U+1F525|&#1F525;|fire, flame, object, tool|
|💧|DROPLET|U+1F4A7|&#1F4A7;|cold, comic, drop, emotion, nature, object, person, sweat, weather|
|🌊|WATER WAVE|U+1F30A|&#1F30A;|nature, ocean, place, water, wave, weather|
|🎃|JACK-O-LANTERN|U+1F383|&#1F383;|activity, celebration, entertainment, halloween, jack, lantern, object|
|🎄|CHRISTMAS TREE|U+1F384|&#1F384;|activity, celebration, christmas, entertainment, object, tree|
|🎆|FIREWORKS|U+1F386|&#1F386;|activity, celebration, entertainment, fireworks, object|
|🎇|FIREWORK SPARKLER|U+1F387|&#1F387;|activity, celebration, entertainment, fireworks, object, sparkle|
|✨|SPARKLES|U+2728|&#2728;|emotion, entertainment, object, sign, sparkle, star|
|🎈|BALLOON|U+1F388|&#1F388;|activity, balloon, celebration, entertainment, object|
|🎉|PARTY POPPER|U+1F389|&#1F389;|activity, celebration, entertainment, object, party, popper, tada|
|🎊|CONFETTI BALL|U+1F38A|&#1F38A;|activity, ball, celebration, confetti, entertainment, object|
|🎋|TANABATA TREE|U+1F38B|&#1F38B;|activity, banner, celebration, entertainment, japanese, object, tree|
|🎍|PINE DECORATION|U+1F38D|&#1F38D;|activity, bamboo, celebration, japanese, object, pine, plant|
|🎎|JAPANESE DOLLS|U+1F38E|&#1F38E;|activity, celebration, doll, entertainment, festival, japanese, object|
|🎏|CARP STREAMER|U+1F38F|&#1F38F;|activity, carp, celebration, entertainment, flag, object, streamer|
|🎐|WIND CHIME|U+1F390|&#1F390;|activity, bell, celebration, chime, entertainment, object, wind|
|🎑|MOON VIEWING CEREMONY|U+1F391|&#1F391;|activity, celebration, ceremony, entertainment, moon, nature, object|
|🎀|RIBBON|U+1F380|&#1F380;|celebration, emotion, object, person, ribbon|
|🎁|WRAPPED PRESENT|U+1F381|&#1F381;|box, celebration, entertainment, gift, object, present, wrapped|
|🎗|REMINDER RIBBON|U+1F397|&#1F397;|celebration, object, reminder, ribbon|
|🎟|ADMISSION TICKETS|U+1F39F|&#1F39F;|admission, entertainment, object, ticket|
|🎫|TICKET|U+1F3AB|&#1F3AB;|activity, admission, entertainment, object, place, ticket|
|🎖|MILITARY MEDAL|U+1F396|&#1F396;|celebration, medal, military, object|
|🏆|TROPHY|U+1F3C6|&#1F3C6;|object, place, prize, sport, trophy|
|🏅|SPORTS MEDAL|U+1F3C5|&#1F3C5;|medal, object, sport|
|⚽|SOCCER BALL|U+26BD|&#26BD;|ball, object, place, soccer, sport|
|⚾|BASEBALL|U+26BE|&#26BE;|ball, baseball, object, place, sport|
|🏀|BASKETBALL AND HOOP|U+1F3C0|&#1F3C0;|ball, basketball, hoop, object, place, sport|
|🏐|VOLLEYBALL|U+1F3D0|&#1F3D0;|ball, game, object, sport, volleyball|
|🏈|AMERICAN FOOTBALL|U+1F3C8|&#1F3C8;|american, ball, football, object, place, sport|
|🏉|RUGBY FOOTBALL|U+1F3C9|&#1F3C9;|ball, football, object, place, rugby, sport|
|🎾|TENNIS RACQUET AND BALL|U+1F3BE|&#1F3BE;|ball, object, place, racquet, sport, tennis|
|🎱|BILLIARDS|U+1F3B1|&#1F3B1;|8, 8 ball, ball, billiard, eight, game, object, place, sport|
|🎳|BOWLING|U+1F3B3|&#1F3B3;|ball, bowling, game, object, place, sport|
|🏏|CRICKET BAT AND BALL|U+1F3CF|&#1F3CF;|ball, bat, cricket, game, object, sport|
|🏑|FIELD HOCKEY STICK AND BALL|U+1F3D1|&#1F3D1;|ball, field, game, hockey, object, sport, stick|
|🏒|ICE HOCKEY STICK AND PUCK|U+1F3D2|&#1F3D2;|game, hockey, ice, object, puck, sport, stick|
|🏓|TABLE TENNIS PADDLE AND BALL|U+1F3D3|&#1F3D3;|ball, bat, game, object, paddle, sport, table tennis|
|🏸|BADMINTON RACQUET AND SHUTTLECOCK|U+1F3F8|&#1F3F8;|badminton, birdie, game, object, racquet, shuttlecock, sport|
|⛳|FLAG IN HOLE|U+26F3|&#26F3;|flag, golf, hole, object, place, sport, travel|
|🏌|GOLFER|U+1F3CC|&#1F3CC;|ball, golf, person, sport|
|⛸|ICE SKATE|U+26F8|&#26F8;|ice, place, skate, sport, travel|
|🎣|FISHING POLE AND FISH|U+1F3A3|&#1F3A3;|entertainment, fish, object, place, pole, sport|
|🎽|RUNNING SHIRT WITH SASH|U+1F3BD|&#1F3BD;|person, place, running, sash, shirt, sport|
|🎿|SKI AND SKI BOOT|U+1F3BF|&#1F3BF;|object, ski, snow, sport|
|⛷|SKIER|U+26F7|&#26F7;|person, ski, snow, sport, travel|
|🏂|SNOWBOARDER|U+1F3C2|&#1F3C2;|person, ski, snow, snowboard, sport|
|🏄|SURFER|U+1F3C4|&#1F3C4;|person, sport, surfer, surfing|
|🏄🏻|SURFER, TYPE-1-2|U+1F3C4 U+1F3FB|&#1F3C4;&#1F3FB;||
|🏄🏼|SURFER, TYPE-3|U+1F3C4 U+1F3FC|&#1F3C4;&#1F3FC;||
|🏄🏽|SURFER, TYPE-4|U+1F3C4 U+1F3FD|&#1F3C4;&#1F3FD;||
|🏄🏾|SURFER, TYPE-5|U+1F3C4 U+1F3FE|&#1F3C4;&#1F3FE;||
|🏄🏿|SURFER, TYPE-6|U+1F3C4 U+1F3FF|&#1F3C4;&#1F3FF;||
|🏇|HORSE RACING|U+1F3C7|&#1F3C7;|horse, jockey, person, racehorse, racing, sport, travel|
|🏊|SWIMMER|U+1F3CA|&#1F3CA;|person, sport, swim, swimmer, travel|
|🏊🏻|SWIMMER, TYPE-1-2|U+1F3CA U+1F3FB|&#1F3CA;&#1F3FB;||
|🏊🏼|SWIMMER, TYPE-3|U+1F3CA U+1F3FC|&#1F3CA;&#1F3FC;||
|🏊🏽|SWIMMER, TYPE-4|U+1F3CA U+1F3FD|&#1F3CA;&#1F3FD;||
|🏊🏾|SWIMMER, TYPE-5|U+1F3CA U+1F3FE|&#1F3CA;&#1F3FE;||
|🏊🏿|SWIMMER, TYPE-6|U+1F3CA U+1F3FF|&#1F3CA;&#1F3FF;||
|⛹|PERSON WITH BALL|U+26F9|&#26F9;|ball, person, sport, travel|
|⛹🏻|PERSON WITH BALL, TYPE-1-2|U+26F9 U+1F3FB|&#26F9;&#1F3FB;||
|⛹🏼|PERSON WITH BALL, TYPE-3|U+26F9 U+1F3FC|&#26F9;&#1F3FC;||
|⛹🏽|PERSON WITH BALL, TYPE-4|U+26F9 U+1F3FD|&#26F9;&#1F3FD;||
|⛹🏾|PERSON WITH BALL, TYPE-5|U+26F9 U+1F3FE|&#26F9;&#1F3FE;||
|⛹🏿|PERSON WITH BALL, TYPE-6|U+26F9 U+1F3FF|&#26F9;&#1F3FF;||
|🏋|WEIGHT LIFTER|U+1F3CB|&#1F3CB;|lifter, person, sport, weight|
|🏋🏻|WEIGHT LIFTER, TYPE-1-2|U+1F3CB U+1F3FB|&#1F3CB;&#1F3FB;||
|🏋🏼|WEIGHT LIFTER, TYPE-3|U+1F3CB U+1F3FC|&#1F3CB;&#1F3FC;||
|🏋🏽|WEIGHT LIFTER, TYPE-4|U+1F3CB U+1F3FD|&#1F3CB;&#1F3FD;||
|🏋🏾|WEIGHT LIFTER, TYPE-5|U+1F3CB U+1F3FE|&#1F3CB;&#1F3FE;||
|🏋🏿|WEIGHT LIFTER, TYPE-6|U+1F3CB U+1F3FF|&#1F3CB;&#1F3FF;||
|🚴|BICYCLIST|U+1F6B4|&#1F6B4;|bicycle, bicyclist, bike, cyclist, person, place, sport, travel|
|🚴🏻|BICYCLIST, TYPE-1-2|U+1F6B4 U+1F3FB|&#1F6B4;&#1F3FB;||
|🚴🏼|BICYCLIST, TYPE-3|U+1F6B4 U+1F3FC|&#1F6B4;&#1F3FC;||
|🚴🏽|BICYCLIST, TYPE-4|U+1F6B4 U+1F3FD|&#1F6B4;&#1F3FD;||
|🚴🏾|BICYCLIST, TYPE-5|U+1F6B4 U+1F3FE|&#1F6B4;&#1F3FE;||
|🚴🏿|BICYCLIST, TYPE-6|U+1F6B4 U+1F3FF|&#1F6B4;&#1F3FF;||
|🚵|MOUNTAIN BICYCLIST|U+1F6B5|&#1F6B5;|bicycle, bicyclist, bike, cyclist, mountain, person, place, sport, travel|
|🚵🏻|MOUNTAIN BICYCLIST, TYPE-1-2|U+1F6B5 U+1F3FB|&#1F6B5;&#1F3FB;||
|🚵🏼|MOUNTAIN BICYCLIST, TYPE-3|U+1F6B5 U+1F3FC|&#1F6B5;&#1F3FC;||
|🚵🏽|MOUNTAIN BICYCLIST, TYPE-4|U+1F6B5 U+1F3FD|&#1F6B5;&#1F3FD;||
|🚵🏾|MOUNTAIN BICYCLIST, TYPE-5|U+1F6B5 U+1F3FE|&#1F6B5;&#1F3FE;||
|🚵🏿|MOUNTAIN BICYCLIST, TYPE-6|U+1F6B5 U+1F3FF|&#1F6B5;&#1F3FF;||
|🏎|RACING CAR|U+1F3CE|&#1F3CE;|car, place, racing, sport, travel|
|🏍|RACING MOTORCYCLE|U+1F3CD|&#1F3CD;|motorcycle, person, racing, sport, travel|
|🎯|DIRECT HIT|U+1F3AF|&#1F3AF;|activity, bull, bullseye, dart, entertainment, eye, game, hit, object, target|
|🎮|VIDEO GAME|U+1F3AE|&#1F3AE;|controller, entertainment, game, object, video game|
|🕹|JOYSTICK|U+1F579|&#1F579;|entertainment, game, joystick, object, video game|
|🎲|GAME DIE|U+1F3B2|&#1F3B2;|dice, die, entertainment, game, object|
|♠|BLACK SPADE SUIT|U+2660|&#2660;|card, game, spade, suit, symbol|
|♥|BLACK HEART SUIT|U+2665|&#2665;|card, emotion, game, heart, hearts, suit, symbol|
|♦|BLACK DIAMOND SUIT|U+2666|&#2666;|card, diamond, diamonds, game, suit, symbol|
|♣|BLACK CLUB SUIT|U+2663|&#2663;|card, club, clubs, game, suit, symbol|
|🃏|PLAYING CARD BLACK JOKER|U+1F0CF|&#1F0CF;|card, entertainment, game, joker, object, playing|
|🀄|MAHJONG TILE RED DRAGON|U+1F004|&#1F004;|game, mahjong, object, red|
|🎴|FLOWER PLAYING CARDS|U+1F3B4|&#1F3B4;|activity, card, entertainment, flower, game, japanese, object, playing|
|🔇|SPEAKER WITH CANCELLATION STROKE|U+1F507|&#1F507;|mute, object, quiet, silent, sound, speaker, volume|
|🔈|SPEAKER|U+1F508|&#1F508;|object, sound, speaker, volume|
|🔉|SPEAKER WITH ONE SOUND WAVE|U+1F509|&#1F509;|low, object, sound, speaker, volume, wave|
|🔊|SPEAKER WITH THREE SOUND WAVES|U+1F50A|&#1F50A;|3, entertainment, high, loud, object, sound, speaker, three, volume|
|📢|PUBLIC ADDRESS LOUDSPEAKER|U+1F4E2|&#1F4E2;|communication, loud, loudspeaker, object, public address, sound|
|📣|CHEERING MEGAPHONE|U+1F4E3|&#1F4E3;|cheering, communication, megaphone, object, sound|
|📯|POSTAL HORN|U+1F4EF|&#1F4EF;|communication, entertainment, horn, object, post, postal, sound|
|🔔|BELL|U+1F514|&#1F514;|bell, object, sound|
|🔕|BELL WITH CANCELLATION STROKE|U+1F515|&#1F515;|bell, forbidden, mute, no, not, object, prohibited, quiet, silent, sound|
|🎼|MUSICAL SCORE|U+1F3BC|&#1F3BC;|activity, entertainment, music, object, score, sound|
|🎵|MUSICAL NOTE|U+1F3B5|&#1F3B5;|activity, entertainment, music, note, object, sound|
|🎶|MULTIPLE MUSICAL NOTES|U+1F3B6|&#1F3B6;|activity, entertainment, music, note, notes, object, sound|
|🎙|STUDIO MICROPHONE|U+1F399|&#1F399;|mic, microphone, music, object, sound, studio|
|🎚|LEVEL SLIDER|U+1F39A|&#1F39A;|level, music, object, slider, sound|
|🎛|CONTROL KNOBS|U+1F39B|&#1F39B;|control, knobs, music, object, sound|
|🎤|MICROPHONE|U+1F3A4|&#1F3A4;|activity, entertainment, karaoke, mic, microphone, object, sound|
|🎧|HEADPHONE|U+1F3A7|&#1F3A7;|activity, earbud, entertainment, headphone, object, sound|
|📻|RADIO|U+1F4FB|&#1F4FB;|entertainment, object, radio, video|
|🎷|SAXOPHONE|U+1F3B7|&#1F3B7;|activity, entertainment, instrument, music, object, sax, saxophone, sound|
|🎸|GUITAR|U+1F3B8|&#1F3B8;|activity, entertainment, guitar, instrument, music, object, sound|
|🎹|MUSICAL KEYBOARD|U+1F3B9|&#1F3B9;|activity, entertainment, instrument, keyboard, music, object, piano, sound|
|🎺|TRUMPET|U+1F3BA|&#1F3BA;|activity, entertainment, instrument, music, object, sound, trumpet|
|🎻|VIOLIN|U+1F3BB|&#1F3BB;|activity, entertainment, instrument, music, object, sound, violin|
|📱|MOBILE PHONE|U+1F4F1|&#1F4F1;|cell, communication, mobile, object, phone, telephone|
|📲|MOBILE PHONE WITH RIGHTWARDS ARROW AT LEFT|U+1F4F2|&#1F4F2;|arrow, call, cell, communication, mobile, object, phone, receive, telephone|
|☎|BLACK TELEPHONE|U+260E|&#260E;|object, office, phone, sound, telephone|
|📞|TELEPHONE RECEIVER|U+1F4DE|&#1F4DE;|communication, object, phone, receiver, sound, telephone|
|📟|PAGER|U+1F4DF|&#1F4DF;|communication, object, office, pager|
|📠|FAX MACHINE|U+1F4E0|&#1F4E0;|communication, fax, object, office|
|🔋|BATTERY|U+1F50B|&#1F50B;|battery, object|
|🔌|ELECTRIC PLUG|U+1F50C|&#1F50C;|electric, electricity, object, plug|
|💻|PERSONAL COMPUTER|U+1F4BB|&#1F4BB;|computer, object, office, pc, personal|
|🖥|DESKTOP COMPUTER|U+1F5A5|&#1F5A5;|computer, desktop, object, office|
|🖨|PRINTER|U+1F5A8|&#1F5A8;|computer, object, office, printer|
|⌨|KEYBOARD|U+2328|&#2328;|computer, keyboard, object|
|🖱|THREE BUTTON MOUSE|U+1F5B1|&#1F5B1;|3, button, computer, mouse, object, office, three|
|🖲|TRACKBALL|U+1F5B2|&#1F5B2;|computer, object, office, trackball|
|💽|MINIDISC|U+1F4BD|&#1F4BD;|computer, disk, entertainment, minidisk, object, office, optical|
|💾|FLOPPY DISK|U+1F4BE|&#1F4BE;|computer, disk, floppy, object, office|
|💿|OPTICAL DISC|U+1F4BF|&#1F4BF;|blu-ray, cd, computer, disk, dvd, object, office, optical|
|📀|DVD|U+1F4C0|&#1F4C0;|blu-ray, cd, computer, disk, dvd, entertainment, object, office, optical|
|🎥|MOVIE CAMERA|U+1F3A5|&#1F3A5;|activity, camera, cinema, entertainment, movie, object|
|🎞|FILM FRAMES|U+1F39E|&#1F39E;|cinema, entertainment, film, frames, movie, object|
|📽|FILM PROJECTOR|U+1F4FD|&#1F4FD;|cinema, entertainment, film, movie, object, projector, video|
|🎬|CLAPPER BOARD|U+1F3AC|&#1F3AC;|activity, clapper, entertainment, movie, object|
|📺|TELEVISION|U+1F4FA|&#1F4FA;|entertainment, object, television, tv, video|
|📷|CAMERA|U+1F4F7|&#1F4F7;|camera, entertainment, object, video|
|📸|CAMERA WITH FLASH|U+1F4F8|&#1F4F8;|camera, flash, object, video|
|📹|VIDEO CAMERA|U+1F4F9|&#1F4F9;|camera, entertainment, object, video|
|📼|VIDEOCASSETTE|U+1F4FC|&#1F4FC;|entertainment, object, tape, vhs, video, videocassette|
|🔍|LEFT-POINTING MAGNIFYING GLASS|U+1F50D|&#1F50D;|glass, magnifying, object, search, tool|
|🔎|RIGHT-POINTING MAGNIFYING GLASS|U+1F50E|&#1F50E;|glass, magnifying, object, search, tool|
|🔬|MICROSCOPE|U+1F52C|&#1F52C;|microscope, object, tool|
|🔭|TELESCOPE|U+1F52D|&#1F52D;|object, telescope, tool|
|📡|SATELLITE ANTENNA|U+1F4E1|&#1F4E1;|antenna, communication, dish, object, office, satellite|
|🕯|CANDLE|U+1F56F|&#1F56F;|candle, light, object|
|💡|ELECTRIC LIGHT BULB|U+1F4A1|&#1F4A1;|bulb, comic, electric, idea, light, object|
|🔦|ELECTRIC TORCH|U+1F526|&#1F526;|electric, flashlight, light, object, tool, torch|
|🏮|IZAKAYA LANTERN|U+1F3EE|&#1F3EE;|bar, japanese, lantern, light, place, red|
|📔|NOTEBOOK WITH DECORATIVE COVER|U+1F4D4|&#1F4D4;|book, cover, decorated, education, notebook, object, office|
|📕|CLOSED BOOK|U+1F4D5|&#1F4D5;|book, closed, education, object, office|
|📖|OPEN BOOK|U+1F4D6|&#1F4D6;|book, education, object, office, open|
|📗|GREEN BOOK|U+1F4D7|&#1F4D7;|book, education, green, object, office|
|📘|BLUE BOOK|U+1F4D8|&#1F4D8;|blue, book, education, object, office|
|📙|ORANGE BOOK|U+1F4D9|&#1F4D9;|book, education, object, office, orange|
|📚|BOOKS|U+1F4DA|&#1F4DA;|book, books, education, object, office|
|📓|NOTEBOOK|U+1F4D3|&#1F4D3;|notebook, object, office|
|📒|LEDGER|U+1F4D2|&#1F4D2;|ledger, notebook, object, office|
|📃|PAGE WITH CURL|U+1F4C3|&#1F4C3;|curl, document, object, office, page|
|📜|SCROLL|U+1F4DC|&#1F4DC;|object, office, paper, scroll|
|📄|PAGE FACING UP|U+1F4C4|&#1F4C4;|document, object, office, page|
|📰|NEWSPAPER|U+1F4F0|&#1F4F0;|communication, news, newspaper, object, paper|
|🗞|ROLLED-UP NEWSPAPER|U+1F5DE|&#1F5DE;|news, newspaper, object, paper, rolled|
|📑|BOOKMARK TABS|U+1F4D1|&#1F4D1;|bookmark, mark, marker, object, office, tabs|
|🔖|BOOKMARK|U+1F516|&#1F516;|bookmark, mark, object|
|🏷|LABEL|U+1F3F7|&#1F3F7;|label, object|
|💰|MONEY BAG|U+1F4B0|&#1F4B0;|bag, dollar, money, moneybag, object, office|
|💴|BANKNOTE WITH YEN SIGN|U+1F4B4|&#1F4B4;|bank, banknote, bill, currency, money, note, object, office, yen|
|💵|BANKNOTE WITH DOLLAR SIGN|U+1F4B5|&#1F4B5;|bank, banknote, bill, currency, dollar, money, note, object, office|
|💶|BANKNOTE WITH EURO SIGN|U+1F4B6|&#1F4B6;|bank, banknote, bill, currency, euro, money, note, object, office|
|💷|BANKNOTE WITH POUND SIGN|U+1F4B7|&#1F4B7;|bank, banknote, bill, currency, money, note, object, office, pound|
|💸|MONEY WITH WINGS|U+1F4B8|&#1F4B8;|bank, banknote, bill, dollar, fly, money, note, object, office, wings|
|💳|CREDIT CARD|U+1F4B3|&#1F4B3;|bank, card, credit, money, object, office|
|💹|CHART WITH UPWARDS TREND AND YEN SIGN|U+1F4B9|&#1F4B9;|bank, chart, currency, graph, growth, market, money, object, office, rise, symbol, trend, upward, yen|
|💱|CURRENCY EXCHANGE|U+1F4B1|&#1F4B1;|bank, currency, exchange, money, object, office, symbol|
|💲|HEAVY DOLLAR SIGN|U+1F4B2|&#1F4B2;|currency, dollar, money, object, office, symbol|
|✉|ENVELOPE|U+2709|&#2709;|e-mail, email, envelope, object, office|
|📧|E-MAIL SYMBOL|U+1F4E7|&#1F4E7;|communication, e-mail, email, letter, mail, object, office|
|📨|INCOMING ENVELOPE|U+1F4E8|&#1F4E8;|communication, e-mail, email, envelope, incoming, letter, mail, object, office, receive|
|📩|ENVELOPE WITH DOWNWARDS ARROW ABOVE|U+1F4E9|&#1F4E9;|arrow, communication, down, e-mail, email, envelope, letter, mail, object, office, outgoing, sent|
|📤|OUTBOX TRAY|U+1F4E4|&#1F4E4;|box, communication, letter, mail, object, office, outbox, sent, tray|
|📥|INBOX TRAY|U+1F4E5|&#1F4E5;|box, communication, inbox, letter, mail, object, office, receive, tray|
|📦|PACKAGE|U+1F4E6|&#1F4E6;|box, communication, object, office, package, parcel|
|📫|CLOSED MAILBOX WITH RAISED FLAG|U+1F4EB|&#1F4EB;|closed, communication, flag, mail, mailbox, object, office, postbox|
|📪|CLOSED MAILBOX WITH LOWERED FLAG|U+1F4EA|&#1F4EA;|closed, communication, flag, lowered, mail, mailbox, object, office, postbox|
|📬|OPEN MAILBOX WITH RAISED FLAG|U+1F4EC|&#1F4EC;|communication, flag, mail, mailbox, object, office, open, postbox|
|📭|OPEN MAILBOX WITH LOWERED FLAG|U+1F4ED|&#1F4ED;|communication, flag, lowered, mail, mailbox, object, office, open, postbox|
|📮|POSTBOX|U+1F4EE|&#1F4EE;|communication, mail, mailbox, object, office, postbox|
|🗳|BALLOT BOX WITH BALLOT|U+1F5F3|&#1F5F3;|ballot, box, object|
|✏|PENCIL|U+270F|&#270F;|object, office, pencil|
|✒|BLACK NIB|U+2712|&#2712;|nib, object, office, pen|
|🖋|LOWER LEFT FOUNTAIN PEN|U+1F58B|&#1F58B;|communication, fountain, object, office, pen|
|🖊|LOWER LEFT BALLPOINT PEN|U+1F58A|&#1F58A;|ballpoint, communication, object, office, pen|
|🖌|LOWER LEFT PAINTBRUSH|U+1F58C|&#1F58C;|communication, object, office, paintbrush, painting|
|🖍|LOWER LEFT CRAYON|U+1F58D|&#1F58D;|communication, crayon, object, office|
|📝|MEMO|U+1F4DD|&#1F4DD;|communication, memo, object, office, pencil|
|💼|BRIEFCASE|U+1F4BC|&#1F4BC;|briefcase, object, office, person|
|📁|FILE FOLDER|U+1F4C1|&#1F4C1;|file, folder, object, office|
|📂|OPEN FILE FOLDER|U+1F4C2|&#1F4C2;|file, folder, object, office, open|
|🗂|CARD INDEX DIVIDERS|U+1F5C2|&#1F5C2;|card, dividers, index, object, office|
|📅|CALENDAR|U+1F4C5|&#1F4C5;|calendar, date, object, office|
|📆|TEAR-OFF CALENDAR|U+1F4C6|&#1F4C6;|calendar, object, office|
|🗒|SPIRAL NOTE PAD|U+1F5D2|&#1F5D2;|note, object, office, pad, spiral|
|🗓|SPIRAL CALENDAR PAD|U+1F5D3|&#1F5D3;|calendar, object, office, pad, spiral|
|📇|CARD INDEX|U+1F4C7|&#1F4C7;|card, index, object, office, rolodex|
|📈|CHART WITH UPWARDS TREND|U+1F4C8|&#1F4C8;|chart, graph, growth, object, office, trend, upward|
|📉|CHART WITH DOWNWARDS TREND|U+1F4C9|&#1F4C9;|chart, down, graph, object, office, trend|
|📊|BAR CHART|U+1F4CA|&#1F4CA;|bar, chart, graph, object, office|
|📋|CLIPBOARD|U+1F4CB|&#1F4CB;|clipboard, object, office|
|📌|PUSHPIN|U+1F4CC|&#1F4CC;|object, office, pin, pushpin|
|📍|ROUND PUSHPIN|U+1F4CD|&#1F4CD;|object, office, pin, place, pushpin|
|📎|PAPERCLIP|U+1F4CE|&#1F4CE;|object, office, paperclip|
|🖇|LINKED PAPERCLIPS|U+1F587|&#1F587;|communication, link, object, office, paperclip|
|📏|STRAIGHT RULER|U+1F4CF|&#1F4CF;|object, office, ruler, straight edge|
|📐|TRIANGULAR RULER|U+1F4D0|&#1F4D0;|object, office, ruler, set, triangle|
|✂|BLACK SCISSORS|U+2702|&#2702;|object, office, scissors, tool|
|🗃|CARD FILE BOX|U+1F5C3|&#1F5C3;|box, card, file, object, office|
|🗄|FILE CABINET|U+1F5C4|&#1F5C4;|cabinet, file, object, office|
|🗑|WASTEBASKET|U+1F5D1|&#1F5D1;|object, office, wastebasket|
|🔒|LOCK|U+1F512|&#1F512;|closed, lock, object|
|🔓|OPEN LOCK|U+1F513|&#1F513;|lock, object, open, unlock|
|🔏|LOCK WITH INK PEN|U+1F50F|&#1F50F;|ink, lock, nib, object, pen, privacy|
|🔐|CLOSED LOCK WITH KEY|U+1F510|&#1F510;|closed, key, lock, object, secure|
|🔑|KEY|U+1F511|&#1F511;|key, lock, object, password|
|🗝|OLD KEY|U+1F5DD|&#1F5DD;|clue, key, lock, object, old|
|🔨|HAMMER|U+1F528|&#1F528;|hammer, object, tool|
|⛏|PICK|U+26CF|&#26CF;|mining, object, pick, tool|
|⚒|HAMMER AND PICK|U+2692|&#2692;|hammer, object, pick, tool|
|🛠|HAMMER AND WRENCH|U+1F6E0|&#1F6E0;|hammer, object, tool, wrench|
|🗡|DAGGER KNIFE|U+1F5E1|&#1F5E1;|dagger, knife, object, weapon|
|⚔|CROSSED SWORDS|U+2694|&#2694;|crossed, object, swords, weapon|
|🔫|PISTOL|U+1F52B|&#1F52B;|gun, handgun, object, pistol, revolver, tool, weapon|
|🏹|BOW AND ARROW|U+1F3F9|&#1F3F9;|archer, arrow, bow, object, sagittarius, sport, tool, weapon, zodiac|
|🛡|SHIELD|U+1F6E1|&#1F6E1;|object, shield, weapon|
|🔧|WRENCH|U+1F527|&#1F527;|object, tool, wrench|
|🔩|NUT AND BOLT|U+1F529|&#1F529;|bolt, nut, object, tool|
|⚙|GEAR|U+2699|&#2699;|gear, object, tool|
|🗜|COMPRESSION|U+1F5DC|&#1F5DC;|compression, object, tool, vice|
|⚗|ALEMBIC|U+2697|&#2697;|alembic, chemistry, object, tool|
|⚖|SCALES|U+2696|&#2696;|balance, justice, libra, object, scales, tool, weight, zodiac|
|🔗|LINK SYMBOL|U+1F517|&#1F517;|link, object, symbol|
|⛓|CHAINS|U+26D3|&#26D3;|chain, object|
|💉|SYRINGE|U+1F489|&#1F489;|doctor, medicine, needle, object, shot, sick, syringe, tool|
|💊|PILL|U+1F48A|&#1F48A;|doctor, medicine, object, pill, sick|
|🚬|SMOKING SYMBOL|U+1F6AC|&#1F6AC;|activity, object, smoking|
|⚰|COFFIN|U+26B0|&#26B0;|coffin, death, object|
|⚱|FUNERAL URN|U+26B1|&#26B1;|death, funeral, object, urn|
|🗿|MOYAI|U+1F5FF|&#1F5FF;|face, moyai, place, statue, travel|
|🛢|OIL DRUM|U+1F6E2|&#1F6E2;|drum, object, oil|
|🔮|CRYSTAL BALL|U+1F52E|&#1F52E;|ball, crystal, fairy tale, fantasy, fortune, object, tool|
|🏧|AUTOMATED TELLER MACHINE|U+1F3E7|&#1F3E7;|atm, automated, bank, place, sign, symbol, teller|
|🚮|PUT LITTER IN ITS PLACE SYMBOL|U+1F6AE|&#1F6AE;|litter, litterbox, place, symbol, travel|
|🚰|POTABLE WATER SYMBOL|U+1F6B0|&#1F6B0;|drink, potable, sign, symbol, travel, water|
|♿|WHEELCHAIR SYMBOL|U+267F|&#267F;|access, sign, symbol, travel, wheelchair|
|🚹|MENS SYMBOL|U+1F6B9|&#1F6B9;|lavatory, man, restroom, sign, symbol, travel, wc|
|🚺|WOMENS SYMBOL|U+1F6BA|&#1F6BA;|lavatory, restroom, sign, symbol, travel, wc, woman|
|🚻|RESTROOM|U+1F6BB|&#1F6BB;|lavatory, restroom, sign, symbol, travel, wc|
|🚼|BABY SYMBOL|U+1F6BC|&#1F6BC;|baby, changing, sign, symbol, travel|
|🚾|WATER CLOSET|U+1F6BE|&#1F6BE;|closet, lavatory, place, restroom, sign, symbol, travel, water, wc|
|🛂|PASSPORT CONTROL|U+1F6C2|&#1F6C2;|control, passport, place, sign, symbol, travel|
|🛃|CUSTOMS|U+1F6C3|&#1F6C3;|customs, place, sign, symbol, travel|
|🛄|BAGGAGE CLAIM|U+1F6C4|&#1F6C4;|baggage, claim, place, sign, symbol, travel|
|🛅|LEFT LUGGAGE|U+1F6C5|&#1F6C5;|baggage, left luggage, locker, luggage, place, sign, symbol, travel|
|⚠|WARNING SIGN|U+26A0|&#26A0;|place, symbol, travel, warning|
|🚸|CHILDREN CROSSING|U+1F6B8|&#1F6B8;|child, crossing, pedestrian, place, sign, symbol, traffic, travel|
|⛔|NO ENTRY|U+26D4|&#26D4;|entry, forbidden, no, not, prohibited, symbol, traffic, travel|
|🚫|NO ENTRY SIGN|U+1F6AB|&#1F6AB;|entry, forbidden, no, not, prohibited, symbol, travel|
|🚳|NO BICYCLES|U+1F6B3|&#1F6B3;|bicycle, bike, forbidden, no, not, place, prohibited, sign, sport, symbol, travel, vehicle|
|🚭|NO SMOKING SYMBOL|U+1F6AD|&#1F6AD;|forbidden, no, not, prohibited, sign, smoking, symbol, travel|
|🚯|DO NOT LITTER SYMBOL|U+1F6AF|&#1F6AF;|forbidden, litter, no, not, prohibited, sign, symbol, travel|
|🚱|NON-POTABLE WATER SYMBOL|U+1F6B1|&#1F6B1;|drink, forbidden, no, not, potable, prohibited, sign, symbol, travel, water|
|🚷|NO PEDESTRIANS|U+1F6B7|&#1F6B7;|forbidden, no, not, pedestrian, place, prohibited, sign, symbol, travel|
|📵|NO MOBILE PHONES|U+1F4F5|&#1F4F5;|cell, communication, forbidden, mobile, no, not, object, phone, prohibited, symbol, telephone|
|🔞|NO ONE UNDER EIGHTEEN SYMBOL|U+1F51E|&#1F51E;|18, age restriction, eighteen, forbidden, no, not, prohibited, symbol, underage, word|
|☢|RADIOACTIVE SIGN|U+2622|&#2622;|radioactive, sign, symbol|
|☣|BIOHAZARD SIGN|U+2623|&#2623;|biohazard, sign, symbol|
|⬆|UPWARDS BLACK ARROW|U+2B06|&#2B06;|arrow, cardinal, direction, north, symbol|
|↗|NORTH EAST ARROW|U+2197|&#2197;|arrow, direction, intercardinal, northeast, symbol|
|➡|BLACK RIGHTWARDS ARROW|U+27A1|&#27A1;|arrow, cardinal, direction, east, symbol|
|↘|SOUTH EAST ARROW|U+2198|&#2198;|arrow, direction, intercardinal, southeast, symbol|
|⬇|DOWNWARDS BLACK ARROW|U+2B07|&#2B07;|arrow, cardinal, direction, down, south, symbol|
|↙|SOUTH WEST ARROW|U+2199|&#2199;|arrow, direction, intercardinal, southwest, symbol|
|⬅|LEFTWARDS BLACK ARROW|U+2B05|&#2B05;|arrow, cardinal, direction, symbol, west|
|↖|NORTH WEST ARROW|U+2196|&#2196;|arrow, direction, intercardinal, northwest, symbol|
|↕|UP DOWN ARROW|U+2195|&#2195;|arrow, symbol|
|↔|LEFT RIGHT ARROW|U+2194|&#2194;|arrow, symbol|
|↩|LEFTWARDS ARROW WITH HOOK|U+21A9|&#21A9;|arrow, symbol|
|↪|RIGHTWARDS ARROW WITH HOOK|U+21AA|&#21AA;|arrow, symbol|
|⤴|ARROW POINTING RIGHTWARDS THEN CURVING UPWARDS|U+2934|&#2934;|arrow, symbol|
|⤵|ARROW POINTING RIGHTWARDS THEN CURVING DOWNWARDS|U+2935|&#2935;|arrow, down, symbol|
|🔃|CLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS|U+1F503|&#1F503;|arrow, clockwise, reload, symbol|
|🔄|ANTICLOCKWISE DOWNWARDS AND UPWARDS OPEN CIRCLE ARROWS|U+1F504|&#1F504;|anticlockwise, arrow, counterclockwise, symbol, withershins|
|🔙|BACK WITH LEFTWARDS ARROW ABOVE|U+1F519|&#1F519;|arrow, back, symbol|
|🔚|END WITH LEFTWARDS ARROW ABOVE|U+1F51A|&#1F51A;|arrow, end, symbol|
|🔛|ON WITH EXCLAMATION MARK WITH LEFT RIGHT ARROW ABOVE|U+1F51B|&#1F51B;|arrow, mark, on, symbol|
|🔜|SOON WITH RIGHTWARDS ARROW ABOVE|U+1F51C|&#1F51C;|arrow, soon, symbol|
|🔝|TOP WITH UPWARDS ARROW ABOVE|U+1F51D|&#1F51D;|arrow, symbol, top, up|
|🛐|PLACE OF WORSHIP|U+1F6D0|&#1F6D0;|place, religion, worship|
|⚛|ATOM SYMBOL|U+269B|&#269B;|atheist, atom, symbol|
|🕉|OM SYMBOL|U+1F549|&#1F549;|hindu, om, religion, symbol|
|✡|STAR OF DAVID|U+2721|&#2721;|david, jew, jewish, religion, star, symbol|
|☸|WHEEL OF DHARMA|U+2638|&#2638;|buddhist, dharma, religion, symbol, wheel|
|☯|YIN YANG|U+262F|&#262F;|religion, sign, symbol, tao, taoist, yang, yin|
|✝|LATIN CROSS|U+271D|&#271D;|christian, cross, religion, symbol|
|☦|ORTHODOX CROSS|U+2626|&#2626;|christian, cross, religion, symbol|
|☪|STAR AND CRESCENT|U+262A|&#262A;|islam, muslim, religion, symbol|
|☮|PEACE SYMBOL|U+262E|&#262E;|peace, sign, symbol|
|🕎|MENORAH WITH NINE BRANCHES|U+1F54E|&#1F54E;|candelabrum, candlestick, menorah, object, place, religion|
|🔯|SIX POINTED STAR WITH MIDDLE DOT|U+1F52F|&#1F52F;|fortune, object, star, symbol|
|♻|BLACK UNIVERSAL RECYCLING SYMBOL|U+267B|&#267B;|recycle, sign, symbol|
|📛|NAME BADGE|U+1F4DB|&#1F4DB;|badge, name, object, office|
|⚜|FLEUR-DE-LIS|U+269C|&#269C;|fleur-de-lis, symbol|
|🔰|JAPANESE SYMBOL FOR BEGINNER|U+1F530|&#1F530;|beginner, chevron, green, japanese, leaf, object, tool, yellow|
|🔱|TRIDENT EMBLEM|U+1F531|&#1F531;|anchor, emblem, object, ship, symbol, tool, trident|
|⭕|HEAVY LARGE CIRCLE|U+2B55|&#2B55;|circle, o, symbol, travel|
|✅|WHITE HEAVY CHECK MARK|U+2705|&#2705;|check, mark, sign, symbol|
|☑|BALLOT BOX WITH CHECK|U+2611|&#2611;|ballot, box, check, sign, symbol|
|✔|HEAVY CHECK MARK|U+2714|&#2714;|check, mark, sign, symbol|
|✖|HEAVY MULTIPLICATION X|U+2716|&#2716;|cancel, multiplication, multiply, sign, symbol, x|
|❌|CROSS MARK|U+274C|&#274C;|cancel, mark, multiplication, multiply, sign, symbol, x|
|❎|NEGATIVE SQUARED CROSS MARK|U+274E|&#274E;|mark, sign, square, symbol|
|➕|HEAVY PLUS SIGN|U+2795|&#2795;|math, plus, sign, symbol|
|➖|HEAVY MINUS SIGN|U+2796|&#2796;|math, minus, sign, symbol|
|➗|HEAVY DIVISION SIGN|U+2797|&#2797;|division, math, sign, symbol|
|➰|CURLY LOOP|U+27B0|&#27B0;|curl, loop, sign, symbol|
|➿|DOUBLE CURLY LOOP|U+27BF|&#27BF;|curl, double, loop, sign, symbol|
|〽|PART ALTERNATION MARK|U+303D|&#303D;|mark, part, sign, symbol|
|✳|EIGHT SPOKED ASTERISK|U+2733|&#2733;|asterisk, sign, symbol|
|✴|EIGHT POINTED BLACK STAR|U+2734|&#2734;|sign, star, symbol|
|❇|SPARKLE|U+2747|&#2747;|sign, sparkle, symbol|
|‼|DOUBLE EXCLAMATION MARK|U+203C|&#203C;|bangbang, exclamation, mark, punctuation, symbol, word|
|⁉|EXCLAMATION QUESTION MARK|U+2049|&#2049;|exclamation, interrobang, mark, punctuation, question, symbol, word|
|❓|BLACK QUESTION MARK ORNAMENT|U+2753|&#2753;|mark, punctuation, question, symbol, word|
|❔|WHITE QUESTION MARK ORNAMENT|U+2754|&#2754;|mark, outlined, punctuation, question, symbol, word|
|❕|WHITE EXCLAMATION MARK ORNAMENT|U+2755|&#2755;|exclamation, mark, outlined, punctuation, symbol, word|
|❗|HEAVY EXCLAMATION MARK SYMBOL|U+2757|&#2757;|exclamation, mark, punctuation, symbol, word|
|〰|WAVY DASH|U+3030|&#3030;|dash, punctuation, sound, symbol, wavy|
|©|COPYRIGHT SIGN|U+00A9|&#00A9;|copyright, symbol, word|
|®|REGISTERED SIGN|U+00AE|&#00AE;|registered, symbol, word|
|™|TRADE MARK SIGN|U+2122|&#2122;|mark, symbol, tm, trademark, word|
|♈|ARIES|U+2648|&#2648;|aries, ram, symbol, time, zodiac|
|♉|TAURUS|U+2649|&#2649;|bull, ox, symbol, taurus, time, zodiac|
|♊|GEMINI|U+264A|&#264A;|gemini, symbol, time, twins, zodiac|
|♋|CANCER|U+264B|&#264B;|cancer, crab, symbol, time, zodiac|
|♌|LEO|U+264C|&#264C;|leo, lion, symbol, time, zodiac|
|♍|VIRGO|U+264D|&#264D;|maiden, symbol, time, virgin, virgo, zodiac|
|♎|LIBRA|U+264E|&#264E;|balance, justice, libra, scales, symbol, time, zodiac|
|♏|SCORPIUS|U+264F|&#264F;|scorpio, scorpion, scorpius, symbol, time, zodiac|
|♐|SAGITTARIUS|U+2650|&#2650;|archer, sagittarius, symbol, time, zodiac|
|♑|CAPRICORN|U+2651|&#2651;|capricorn, goat, symbol, time, zodiac|
|♒|AQUARIUS|U+2652|&#2652;|aquarius, bearer, symbol, time, water, zodiac|
|♓|PISCES|U+2653|&#2653;|fish, pisces, symbol, time, zodiac|
|⛎|OPHIUCHUS|U+26CE|&#26CE;|bearer, ophiuchus, serpent, snake, symbol, zodiac|
|🔀|TWISTED RIGHTWARDS ARROWS|U+1F500|&#1F500;|arrow, crossed, symbol|
|🔁|CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS|U+1F501|&#1F501;|arrow, clockwise, repeat, symbol|
|🔂|CLOCKWISE RIGHTWARDS AND LEFTWARDS OPEN CIRCLE ARROWS WITH CIRCLED ONE OVERLAY|U+1F502|&#1F502;|arrow, clockwise, once, symbol|
|▶|BLACK RIGHT-POINTING TRIANGLE|U+25B6|&#25B6;|arrow, play, right, sound, symbol, triangle|
|⏩|BLACK RIGHT-POINTING DOUBLE TRIANGLE|U+23E9|&#23E9;|arrow, double, fast, forward, sound, symbol|
|⏭|BLACK RIGHT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR|U+23ED|&#23ED;|arrow, next scene, next track, sound, symbol, triangle|
|⏯|BLACK RIGHT-POINTING TRIANGLE WITH DOUBLE VERTICAL BAR|U+23EF|&#23EF;|arrow, pause, play, right, sound, symbol, triangle|
|◀|BLACK LEFT-POINTING TRIANGLE|U+25C0|&#25C0;|arrow, left, reverse, sound, symbol, triangle|
|⏪|BLACK LEFT-POINTING DOUBLE TRIANGLE|U+23EA|&#23EA;|arrow, double, rewind, sound, symbol|
|⏮|BLACK LEFT-POINTING DOUBLE TRIANGLE WITH VERTICAL BAR|U+23EE|&#23EE;|arrow, previous scene, previous track, sound, symbol, triangle|
|🔼|UP-POINTING SMALL RED TRIANGLE|U+1F53C|&#1F53C;|arrow, button, red, symbol|
|⏫|BLACK UP-POINTING DOUBLE TRIANGLE|U+23EB|&#23EB;|arrow, double, sound, symbol|
|🔽|DOWN-POINTING SMALL RED TRIANGLE|U+1F53D|&#1F53D;|arrow, button, down, red, symbol|
|⏬|BLACK DOWN-POINTING DOUBLE TRIANGLE|U+23EC|&#23EC;|arrow, double, down, sound, symbol|
|⏸|DOUBLE VERTICAL BAR|U+23F8|&#23F8;|bar, double, pause, sound, symbol, vertical|
|⏹|BLACK SQUARE FOR STOP|U+23F9|&#23F9;|sound, square, stop, symbol|
|⏺|BLACK CIRCLE FOR RECORD|U+23FA|&#23FA;|circle, record, sound, symbol|
|⏏|EJECT SYMBOL|U+23CF|&#23CF;|eject, sound, symbol|
|🎦|CINEMA|U+1F3A6|&#1F3A6;|activity, camera, cinema, entertainment, film, movie, object, symbol|
|🔅|LOW BRIGHTNESS SYMBOL|U+1F505|&#1F505;|brightness, dim, low, sign, symbol|
|🔆|HIGH BRIGHTNESS SYMBOL|U+1F506|&#1F506;|bright, brightness, sign, symbol|
|📶|ANTENNA WITH BARS|U+1F4F6|&#1F4F6;|antenna, bar, cell, communication, mobile, object, phone, signal, symbol, telephone|
|📳|VIBRATION MODE|U+1F4F3|&#1F4F3;|cell, communication, mobile, mode, object, phone, symbol, telephone, vibration|
|📴|MOBILE PHONE OFF|U+1F4F4|&#1F4F4;|cell, communication, mobile, object, off, phone, symbol, telephone|
|#️⃣|Keycap NUMBER SIGN|U+0023 U+FE0F U+20E3|&#0023;&#FE0F;&#20E3;|hash, keycap, pound, symbol, word|
|*️⃣|Keycap ASTERISK|U+002A U+FE0F U+20E3|&#002A;&#FE0F;&#20E3;|asterisk, keycap, star, symbol|
|0️⃣|Keycap DIGIT ZERO|U+0030 U+FE0F U+20E3|&#0030;&#FE0F;&#20E3;|0, keycap, symbol, word, zero|
|1️⃣|Keycap DIGIT ONE|U+0031 U+FE0F U+20E3|&#0031;&#FE0F;&#20E3;|1, keycap, one, symbol, word|
|2️⃣|Keycap DIGIT TWO|U+0032 U+FE0F U+20E3|&#0032;&#FE0F;&#20E3;|2, keycap, symbol, two, word|
|3️⃣|Keycap DIGIT THREE|U+0033 U+FE0F U+20E3|&#0033;&#FE0F;&#20E3;|3, keycap, symbol, three, word|
|4️⃣|Keycap DIGIT FOUR|U+0034 U+FE0F U+20E3|&#0034;&#FE0F;&#20E3;|4, four, keycap, symbol, word|
|5️⃣|Keycap DIGIT FIVE|U+0035 U+FE0F U+20E3|&#0035;&#FE0F;&#20E3;|5, five, keycap, symbol, word|
|6️⃣|Keycap DIGIT SIX|U+0036 U+FE0F U+20E3|&#0036;&#FE0F;&#20E3;|6, keycap, six, symbol, word|
|7️⃣|Keycap DIGIT SEVEN|U+0037 U+FE0F U+20E3|&#0037;&#FE0F;&#20E3;|7, keycap, seven, symbol, word|
|8️⃣|Keycap DIGIT EIGHT|U+0038 U+FE0F U+20E3|&#0038;&#FE0F;&#20E3;|8, eight, keycap, symbol, word|
|9️⃣|Keycap DIGIT NINE|U+0039 U+FE0F U+20E3|&#0039;&#FE0F;&#20E3;|9, keycap, nine, symbol, word|
|🔟|KEYCAP TEN|U+1F51F|&#1F51F;|10, keycap, symbol, ten, word|
|💯|HUNDRED POINTS SYMBOL|U+1F4AF|&#1F4AF;|100, full, hundred, office, score, symbol|
|🔠|INPUT SYMBOL FOR LATIN CAPITAL LETTERS|U+1F520|&#1F520;|input, latin, letters, symbol, uppercase, word|
|🔡|INPUT SYMBOL FOR LATIN SMALL LETTERS|U+1F521|&#1F521;|abcd, input, latin, letters, lowercase, symbol, word|
|🔢|INPUT SYMBOL FOR NUMBERS|U+1F522|&#1F522;|1234, input, numbers, symbol, word|
|🔣|INPUT SYMBOL FOR SYMBOLS|U+1F523|&#1F523;|input, symbol, word|
|🔤|INPUT SYMBOL FOR LATIN LETTERS|U+1F524|&#1F524;|abc, alphabet, input, latin, letters, symbol, word|
|🅰|NEGATIVE SQUARED LATIN CAPITAL LETTER A|U+1F170|&#1F170;|a, blood, symbol, word|
|🆎|NEGATIVE SQUARED AB|U+1F18E|&#1F18E;|ab, blood, symbol, word|
|🅱|NEGATIVE SQUARED LATIN CAPITAL LETTER B|U+1F171|&#1F171;|b, blood, symbol, word|
|🆑|SQUARED CL|U+1F191|&#1F191;|cl, symbol, word|
|🆒|SQUARED COOL|U+1F192|&#1F192;|cool, symbol, word|
|🆓|SQUARED FREE|U+1F193|&#1F193;|free, symbol, word|
|ℹ|INFORMATION SOURCE|U+2139|&#2139;|i, information, symbol, word|
|🆔|SQUARED ID|U+1F194|&#1F194;|id, identity, symbol, word|
|Ⓜ|CIRCLED LATIN CAPITAL LETTER M|U+24C2|&#24C2;|circle, m, place, symbol, word|
|🆕|SQUARED NEW|U+1F195|&#1F195;|new, symbol, word|
|🆖|SQUARED NG|U+1F196|&#1F196;|ng, symbol, word|
|🅾|NEGATIVE SQUARED LATIN CAPITAL LETTER O|U+1F17E|&#1F17E;|blood, o, symbol, word|
|🆗|SQUARED OK|U+1F197|&#1F197;|ok, symbol, word|
|🅿|NEGATIVE SQUARED LATIN CAPITAL LETTER P|U+1F17F|&#1F17F;|parking, place, sign, symbol, word|
|🆘|SQUARED SOS|U+1F198|&#1F198;|help, sos, symbol, word|
|🆙|SQUARED UP WITH EXCLAMATION MARK|U+1F199|&#1F199;|mark, symbol, up, word|
|🆚|SQUARED VS|U+1F19A|&#1F19A;|symbol, versus, vs, word|
|🈁|SQUARED KATAKANA KOKO|U+1F201|&#1F201;|japanese, symbol, word|
|🈂|SQUARED KATAKANA SA|U+1F202|&#1F202;|japanese, symbol, word|
|🈷|SQUARED CJK UNIFIED IDEOGRAPH-6708|U+1F237|&#1F237;|japanese, symbol, word|
|🈶|SQUARED CJK UNIFIED IDEOGRAPH-6709|U+1F236|&#1F236;|japanese, symbol, word|
|🈯|SQUARED CJK UNIFIED IDEOGRAPH-6307|U+1F22F|&#1F22F;|japanese, symbol, word|
|🉐|CIRCLED IDEOGRAPH ADVANTAGE|U+1F250|&#1F250;|japanese, symbol, word|
|🈹|SQUARED CJK UNIFIED IDEOGRAPH-5272|U+1F239|&#1F239;|japanese, symbol, word|
|🈚|SQUARED CJK UNIFIED IDEOGRAPH-7121|U+1F21A|&#1F21A;|japanese, symbol, word|
|🈲|SQUARED CJK UNIFIED IDEOGRAPH-7981|U+1F232|&#1F232;|japanese, symbol, word|
|🉑|CIRCLED IDEOGRAPH ACCEPT|U+1F251|&#1F251;|chinese, symbol, word|
|🈸|SQUARED CJK UNIFIED IDEOGRAPH-7533|U+1F238|&#1F238;|chinese, symbol, word|
|🈴|SQUARED CJK UNIFIED IDEOGRAPH-5408|U+1F234|&#1F234;|chinese, symbol, word|
|🈳|SQUARED CJK UNIFIED IDEOGRAPH-7A7A|U+1F233|&#1F233;|chinese, symbol, word|
|㊗|CIRCLED IDEOGRAPH CONGRATULATION|U+3297|&#3297;|chinese, congratulation, congratulations, ideograph, symbol, word|
|㊙|CIRCLED IDEOGRAPH SECRET|U+3299|&#3299;|chinese, ideograph, secret, symbol, word|
|🈺|SQUARED CJK UNIFIED IDEOGRAPH-55B6|U+1F23A|&#1F23A;|chinese, symbol, word|
|🈵|SQUARED CJK UNIFIED IDEOGRAPH-6E80|U+1F235|&#1F235;|chinese, symbol, word|
|▪|BLACK SMALL SQUARE|U+25AA|&#25AA;|geometric, sign, square, symbol|
|▫|WHITE SMALL SQUARE|U+25AB|&#25AB;|geometric, sign, square, symbol|
|◻|WHITE MEDIUM SQUARE|U+25FB|&#25FB;|geometric, sign, square, symbol|
|◼|BLACK MEDIUM SQUARE|U+25FC|&#25FC;|geometric, sign, square, symbol|
|◽|WHITE MEDIUM SMALL SQUARE|U+25FD|&#25FD;|geometric, sign, square, symbol|
|◾|BLACK MEDIUM SMALL SQUARE|U+25FE|&#25FE;|geometric, sign, square, symbol|
|⬛|BLACK LARGE SQUARE|U+2B1B|&#2B1B;|geometric, sign, square, symbol|
|⬜|WHITE LARGE SQUARE|U+2B1C|&#2B1C;|geometric, sign, square, symbol|
|🔶|LARGE ORANGE DIAMOND|U+1F536|&#1F536;|diamond, geometric, orange, sign, symbol|
|🔷|LARGE BLUE DIAMOND|U+1F537|&#1F537;|blue, diamond, geometric, sign, symbol|
|🔸|SMALL ORANGE DIAMOND|U+1F538|&#1F538;|diamond, geometric, orange, sign, symbol|
|🔹|SMALL BLUE DIAMOND|U+1F539|&#1F539;|blue, diamond, geometric, sign, symbol|
|🔺|UP-POINTING RED TRIANGLE|U+1F53A|&#1F53A;|geometric, red, sign, symbol|
|🔻|DOWN-POINTING RED TRIANGLE|U+1F53B|&#1F53B;|down, geometric, red, sign, symbol|
|💠|DIAMOND SHAPE WITH A DOT INSIDE|U+1F4A0|&#1F4A0;|comic, diamond, geometric, inside, sign, symbol|
|🔘|RADIO BUTTON|U+1F518|&#1F518;|button, geometric, radio, sign, symbol|
|🔲|BLACK SQUARE BUTTON|U+1F532|&#1F532;|button, geometric, sign, square, symbol|
|🔳|WHITE SQUARE BUTTON|U+1F533|&#1F533;|button, geometric, outlined, sign, square, symbol|
|⚪|MEDIUM WHITE CIRCLE|U+26AA|&#26AA;|circle, geometric, sign, symbol|
|⚫|MEDIUM BLACK CIRCLE|U+26AB|&#26AB;|circle, geometric, sign, symbol|
|🔴|LARGE RED CIRCLE|U+1F534|&#1F534;|circle, geometric, red, sign, symbol|
|🔵|LARGE BLUE CIRCLE|U+1F535|&#1F535;|blue, circle, geometric, sign, symbol|
|🏁|CHEQUERED FLAG|U+1F3C1|&#1F3C1;|checkered, chequered, flag, object, place, racing, sport|
|🚩|TRIANGULAR FLAG ON POST|U+1F6A9|&#1F6A9;|flag, object, place, post, travel|
|🎌|CROSSED FLAGS|U+1F38C|&#1F38C;|activity, celebration, cross, crossed, flag, japanese, object|
|🏴|WAVING BLACK FLAG|U+1F3F4|&#1F3F4;|flag, object, waving|
|🏳|WAVING WHITE FLAG|U+1F3F3|&#1F3F3;|flag, object, waving|
|🇦🇨|Flag for Ascension Island|U+1F1E6 U+1F1E8|&#1F1E6;&#1F1E8;|ascension, flag, island, other|
|🇦🇩|Flag for Andorra|U+1F1E6 U+1F1E9|&#1F1E6;&#1F1E9;|andorra, flag, other|
|🇦🇪|Flag for United Arab Emirates|U+1F1E6 U+1F1EA|&#1F1E6;&#1F1EA;|emirates, flag, other, uae, united|
|🇦🇫|Flag for Afghanistan|U+1F1E6 U+1F1EB|&#1F1E6;&#1F1EB;|afghanistan, flag, other|
|🇦🇬|Flag for Antigua & Barbuda|U+1F1E6 U+1F1EC|&#1F1E6;&#1F1EC;|antigua, barbuda, flag, other|
|🇦🇮|Flag for Anguilla|U+1F1E6 U+1F1EE|&#1F1E6;&#1F1EE;|anguilla, flag, other|
|🇦🇱|Flag for Albania|U+1F1E6 U+1F1F1|&#1F1E6;&#1F1F1;|albania, flag, other|
|🇦🇲|Flag for Armenia|U+1F1E6 U+1F1F2|&#1F1E6;&#1F1F2;|armenia, flag, other|
|🇦🇴|Flag for Angola|U+1F1E6 U+1F1F4|&#1F1E6;&#1F1F4;|angola, flag, other|
|🇦🇶|Flag for Antarctica|U+1F1E6 U+1F1F6|&#1F1E6;&#1F1F6;|antarctica, flag, other|
|🇦🇷|Flag for Argentina|U+1F1E6 U+1F1F7|&#1F1E6;&#1F1F7;|argentina, flag, other|
|🇦🇸|Flag for American Samoa|U+1F1E6 U+1F1F8|&#1F1E6;&#1F1F8;|american, flag, other, samoa|
|🇦🇹|Flag for Austria|U+1F1E6 U+1F1F9|&#1F1E6;&#1F1F9;|austria, flag, other|
|🇦🇺|Flag for Australia|U+1F1E6 U+1F1FA|&#1F1E6;&#1F1FA;|australia, flag, other|
|🇦🇼|Flag for Aruba|U+1F1E6 U+1F1FC|&#1F1E6;&#1F1FC;|aruba, flag, other|
|🇦🇿|Flag for Azerbaijan|U+1F1E6 U+1F1FF|&#1F1E6;&#1F1FF;|azerbaijan, flag, other|
|🇧🇦|Flag for Bosnia & Herzegovina|U+1F1E7 U+1F1E6|&#1F1E7;&#1F1E6;|bosnia, flag, herzegovina, other|
|🇧🇧|Flag for Barbados|U+1F1E7 U+1F1E7|&#1F1E7;&#1F1E7;|barbados, flag, other|
|🇧🇩|Flag for Bangladesh|U+1F1E7 U+1F1E9|&#1F1E7;&#1F1E9;|bangladesh, flag, other|
|🇧🇪|Flag for Belgium|U+1F1E7 U+1F1EA|&#1F1E7;&#1F1EA;|belgium, flag, other|
|🇧🇫|Flag for Burkina Faso|U+1F1E7 U+1F1EB|&#1F1E7;&#1F1EB;|burkina faso, flag, other|
|🇧🇬|Flag for Bulgaria|U+1F1E7 U+1F1EC|&#1F1E7;&#1F1EC;|bulgaria, flag, other|
|🇧🇭|Flag for Bahrain|U+1F1E7 U+1F1ED|&#1F1E7;&#1F1ED;|bahrain, flag, other|
|🇧🇮|Flag for Burundi|U+1F1E7 U+1F1EE|&#1F1E7;&#1F1EE;|burundi, flag, other|
|🇧🇯|Flag for Benin|U+1F1E7 U+1F1EF|&#1F1E7;&#1F1EF;|benin, flag, other|
|🇧🇲|Flag for Bermuda|U+1F1E7 U+1F1F2|&#1F1E7;&#1F1F2;|bermuda, flag, other|
|🇧🇳|Flag for Brunei|U+1F1E7 U+1F1F3|&#1F1E7;&#1F1F3;|brunei, darussalam, flag, other|
|🇧🇴|Flag for Bolivia|U+1F1E7 U+1F1F4|&#1F1E7;&#1F1F4;|bolivia, flag, other|
|🇧🇶|Flag for Caribbean Netherlands|U+1F1E7 U+1F1F6|&#1F1E7;&#1F1F6;|bonaire, caribbean, eustatius, flag, netherlands, other, saba, sint|
|🇧🇷|Flag for Brazil|U+1F1E7 U+1F1F7|&#1F1E7;&#1F1F7;|brazil, flag, other|
|🇧🇸|Flag for Bahamas|U+1F1E7 U+1F1F8|&#1F1E7;&#1F1F8;|bahamas, flag, other|
|🇧🇹|Flag for Bhutan|U+1F1E7 U+1F1F9|&#1F1E7;&#1F1F9;|bhutan, flag, other|
|🇧🇻|Flag for Bouvet Island|U+1F1E7 U+1F1FB|&#1F1E7;&#1F1FB;|bouvet, flag, island, other|
|🇧🇼|Flag for Botswana|U+1F1E7 U+1F1FC|&#1F1E7;&#1F1FC;|botswana, flag, other|
|🇧🇾|Flag for Belarus|U+1F1E7 U+1F1FE|&#1F1E7;&#1F1FE;|belarus, flag, other|
|🇧🇿|Flag for Belize|U+1F1E7 U+1F1FF|&#1F1E7;&#1F1FF;|belize, flag, other|
|🇨🇦|Flag for Canada|U+1F1E8 U+1F1E6|&#1F1E8;&#1F1E6;|canada, flag, other|
|🇨🇨|Flag for Cocos Islands|U+1F1E8 U+1F1E8|&#1F1E8;&#1F1E8;|cocos, flag, island, keeling, other|
|🇨🇩|Flag for Congo - Kinshasa|U+1F1E8 U+1F1E9|&#1F1E8;&#1F1E9;|congo, congo-kinshasa, democratic republic of congo, drc, flag, kinshasa, other, republic|
|🇨🇫|Flag for Central African Republic|U+1F1E8 U+1F1EB|&#1F1E8;&#1F1EB;|central african republic, flag, other, republic|
|🇨🇬|Flag for Congo - Brazzaville|U+1F1E8 U+1F1EC|&#1F1E8;&#1F1EC;|brazzaville, congo, congo republic, congo-brazzaville, flag, other, republic, republic of the congo|
|🇨🇭|Flag for Switzerland|U+1F1E8 U+1F1ED|&#1F1E8;&#1F1ED;|flag, other, switzerland|
|🇨🇰|Flag for Cook Islands|U+1F1E8 U+1F1F0|&#1F1E8;&#1F1F0;|cook, flag, island, other|
|🇨🇱|Flag for Chile|U+1F1E8 U+1F1F1|&#1F1E8;&#1F1F1;|chile, flag, other|
|🇨🇲|Flag for Cameroon|U+1F1E8 U+1F1F2|&#1F1E8;&#1F1F2;|cameroon, flag, other|
|🇨🇳|Flag for China|U+1F1E8 U+1F1F3|&#1F1E8;&#1F1F3;|china, flag, other|
|🇨🇴|Flag for Colombia|U+1F1E8 U+1F1F4|&#1F1E8;&#1F1F4;|colombia, flag, other|
|🇨🇵|Flag for Clipperton Island|U+1F1E8 U+1F1F5|&#1F1E8;&#1F1F5;|clipperton, flag, island, other|
|🇨🇷|Flag for Costa Rica|U+1F1E8 U+1F1F7|&#1F1E8;&#1F1F7;|costa rica, flag, other|
|🇨🇺|Flag for Cuba|U+1F1E8 U+1F1FA|&#1F1E8;&#1F1FA;|cuba, flag, other|
|🇨🇻|Flag for Cape Verde|U+1F1E8 U+1F1FB|&#1F1E8;&#1F1FB;|cabo, cape, flag, other, verde|
|🇨🇽|Flag for Christmas Island|U+1F1E8 U+1F1FD|&#1F1E8;&#1F1FD;|christmas, flag, island, other|
|🇨🇾|Flag for Cyprus|U+1F1E8 U+1F1FE|&#1F1E8;&#1F1FE;|cyprus, flag, other|
|🇨🇿|Flag for Czech Republic|U+1F1E8 U+1F1FF|&#1F1E8;&#1F1FF;|czech republic, flag, other|
|🇩🇪|Flag for Germany|U+1F1E9 U+1F1EA|&#1F1E9;&#1F1EA;|flag, germany, other|
|🇩🇬|Flag for Diego Garcia|U+1F1E9 U+1F1EC|&#1F1E9;&#1F1EC;|diego garcia, flag, other|
|🇩🇯|Flag for Djibouti|U+1F1E9 U+1F1EF|&#1F1E9;&#1F1EF;|djibouti, flag, other|
|🇩🇰|Flag for Denmark|U+1F1E9 U+1F1F0|&#1F1E9;&#1F1F0;|denmark, flag, other|
|🇩🇲|Flag for Dominica|U+1F1E9 U+1F1F2|&#1F1E9;&#1F1F2;|dominica, flag, other|
|🇩🇴|Flag for Dominican Republic|U+1F1E9 U+1F1F4|&#1F1E9;&#1F1F4;|dominican republic, flag, other|
|🇩🇿|Flag for Algeria|U+1F1E9 U+1F1FF|&#1F1E9;&#1F1FF;|algeria, flag, other|
|🇪🇦|Flag for Ceuta & Melilla|U+1F1EA U+1F1E6|&#1F1EA;&#1F1E6;|ceuta, flag, melilla, other|
|🇪🇨|Flag for Ecuador|U+1F1EA U+1F1E8|&#1F1EA;&#1F1E8;|ecuador, flag, other|
|🇪🇪|Flag for Estonia|U+1F1EA U+1F1EA|&#1F1EA;&#1F1EA;|estonia, flag, other|
|🇪🇬|Flag for Egypt|U+1F1EA U+1F1EC|&#1F1EA;&#1F1EC;|egypt, flag, other|
|🇪🇭|Flag for Western Sahara|U+1F1EA U+1F1ED|&#1F1EA;&#1F1ED;|flag, other, sahara, west, western sahara|
|🇪🇷|Flag for Eritrea|U+1F1EA U+1F1F7|&#1F1EA;&#1F1F7;|eritrea, flag, other|
|🇪🇸|Flag for Spain|U+1F1EA U+1F1F8|&#1F1EA;&#1F1F8;|flag, other, spain|
|🇪🇹|Flag for Ethiopia|U+1F1EA U+1F1F9|&#1F1EA;&#1F1F9;|ethiopia, flag, other|
|🇪🇺|Flag for European Union|U+1F1EA U+1F1FA|&#1F1EA;&#1F1FA;|european union, flag, other|
|🇫🇮|Flag for Finland|U+1F1EB U+1F1EE|&#1F1EB;&#1F1EE;|finland, flag, other|
|🇫🇯|Flag for Fiji|U+1F1EB U+1F1EF|&#1F1EB;&#1F1EF;|fiji, flag, other|
|🇫🇰|Flag for Falkland Islands|U+1F1EB U+1F1F0|&#1F1EB;&#1F1F0;|falkland, falklands, flag, island, islas, malvinas, other|
|🇫🇲|Flag for Micronesia|U+1F1EB U+1F1F2|&#1F1EB;&#1F1F2;|flag, micronesia, other|
|🇫🇴|Flag for Faroe Islands|U+1F1EB U+1F1F4|&#1F1EB;&#1F1F4;|faroe, flag, island, other|
|🇫🇷|Flag for France|U+1F1EB U+1F1F7|&#1F1EB;&#1F1F7;|flag, france, other|
|🇬🇦|Flag for Gabon|U+1F1EC U+1F1E6|&#1F1EC;&#1F1E6;|flag, gabon, other|
|🇬🇧|Flag for United Kingdom|U+1F1EC U+1F1E7|&#1F1EC;&#1F1E7;|britain, british, cornwall, england, flag, great britain, ireland, northern ireland, other, scotland, uk, union jack, united, united kingdom, wales|
|🇬🇩|Flag for Grenada|U+1F1EC U+1F1E9|&#1F1EC;&#1F1E9;|flag, grenada, other|
|🇬🇪|Flag for Georgia|U+1F1EC U+1F1EA|&#1F1EC;&#1F1EA;|flag, georgia, other|
|🇬🇫|Flag for French Guiana|U+1F1EC U+1F1EB|&#1F1EC;&#1F1EB;|flag, french, guiana, other|
|🇬🇬|Flag for Guernsey|U+1F1EC U+1F1EC|&#1F1EC;&#1F1EC;|flag, guernsey, other|
|🇬🇭|Flag for Ghana|U+1F1EC U+1F1ED|&#1F1EC;&#1F1ED;|flag, ghana, other|
|🇬🇮|Flag for Gibraltar|U+1F1EC U+1F1EE|&#1F1EC;&#1F1EE;|flag, gibraltar, other|
|🇬🇱|Flag for Greenland|U+1F1EC U+1F1F1|&#1F1EC;&#1F1F1;|flag, greenland, other|
|🇬🇲|Flag for Gambia|U+1F1EC U+1F1F2|&#1F1EC;&#1F1F2;|flag, gambia, other|
|🇬🇳|Flag for Guinea|U+1F1EC U+1F1F3|&#1F1EC;&#1F1F3;|flag, guinea, other|
|🇬🇵|Flag for Guadeloupe|U+1F1EC U+1F1F5|&#1F1EC;&#1F1F5;|flag, guadeloupe, other|
|🇬🇶|Flag for Equatorial Guinea|U+1F1EC U+1F1F6|&#1F1EC;&#1F1F6;|equatorial guinea, flag, guinea, other|
|🇬🇷|Flag for Greece|U+1F1EC U+1F1F7|&#1F1EC;&#1F1F7;|flag, greece, other|
|🇬🇸|Flag for South Georgia & South Sandwich Islands|U+1F1EC U+1F1F8|&#1F1EC;&#1F1F8;|flag, georgia, island, other, south, south georgia, south sandwich|
|🇬🇹|Flag for Guatemala|U+1F1EC U+1F1F9|&#1F1EC;&#1F1F9;|flag, guatemala, other|
|🇬🇺|Flag for Guam|U+1F1EC U+1F1FA|&#1F1EC;&#1F1FA;|flag, guam, other|
|🇬🇼|Flag for Guinea-Bissau|U+1F1EC U+1F1FC|&#1F1EC;&#1F1FC;|bissau, flag, guinea, other|
|🇬🇾|Flag for Guyana|U+1F1EC U+1F1FE|&#1F1EC;&#1F1FE;|flag, guyana, other|
|🇭🇰|Flag for Hong Kong|U+1F1ED U+1F1F0|&#1F1ED;&#1F1F0;|china, flag, hong kong, other|
|🇭🇲|Flag for Heard & McDonald Islands|U+1F1ED U+1F1F2|&#1F1ED;&#1F1F2;|flag, heard, island, mcdonald, other|
|🇭🇳|Flag for Honduras|U+1F1ED U+1F1F3|&#1F1ED;&#1F1F3;|flag, honduras, other|
|🇭🇷|Flag for Croatia|U+1F1ED U+1F1F7|&#1F1ED;&#1F1F7;|croatia, flag, other|
|🇭🇹|Flag for Haiti|U+1F1ED U+1F1F9|&#1F1ED;&#1F1F9;|flag, haiti, other|
|🇭🇺|Flag for Hungary|U+1F1ED U+1F1FA|&#1F1ED;&#1F1FA;|flag, hungary, other|
|🇮🇨|Flag for Canary Islands|U+1F1EE U+1F1E8|&#1F1EE;&#1F1E8;|canary, flag, island, other|
|🇮🇩|Flag for Indonesia|U+1F1EE U+1F1E9|&#1F1EE;&#1F1E9;|flag, indonesia, other|
|🇮🇪|Flag for Ireland|U+1F1EE U+1F1EA|&#1F1EE;&#1F1EA;|flag, ireland, other|
|🇮🇱|Flag for Israel|U+1F1EE U+1F1F1|&#1F1EE;&#1F1F1;|flag, israel, other|
|🇮🇲|Flag for Isle of Man|U+1F1EE U+1F1F2|&#1F1EE;&#1F1F2;|flag, isle of man, other|
|🇮🇳|Flag for India|U+1F1EE U+1F1F3|&#1F1EE;&#1F1F3;|flag, india, other|
|🇮🇴|Flag for British Indian Ocean Territory|U+1F1EE U+1F1F4|&#1F1EE;&#1F1F4;|british, chagos, flag, indian ocean, island, other|
|🇮🇶|Flag for Iraq|U+1F1EE U+1F1F6|&#1F1EE;&#1F1F6;|flag, iraq, other|
|🇮🇷|Flag for Iran|U+1F1EE U+1F1F7|&#1F1EE;&#1F1F7;|flag, iran, other|
|🇮🇸|Flag for Iceland|U+1F1EE U+1F1F8|&#1F1EE;&#1F1F8;|flag, iceland, other|
|🇮🇹|Flag for Italy|U+1F1EE U+1F1F9|&#1F1EE;&#1F1F9;|flag, italy, other|
|🇯🇪|Flag for Jersey|U+1F1EF U+1F1EA|&#1F1EF;&#1F1EA;|flag, jersey, other|
|🇯🇲|Flag for Jamaica|U+1F1EF U+1F1F2|&#1F1EF;&#1F1F2;|flag, jamaica, other|
|🇯🇴|Flag for Jordan|U+1F1EF U+1F1F4|&#1F1EF;&#1F1F4;|flag, jordan, other|
|🇯🇵|Flag for Japan|U+1F1EF U+1F1F5|&#1F1EF;&#1F1F5;|flag, japan, other|
|🇰🇪|Flag for Kenya|U+1F1F0 U+1F1EA|&#1F1F0;&#1F1EA;|flag, kenya, other|
|🇰🇬|Flag for Kyrgyzstan|U+1F1F0 U+1F1EC|&#1F1F0;&#1F1EC;|flag, kyrgyzstan, other|
|🇰🇭|Flag for Cambodia|U+1F1F0 U+1F1ED|&#1F1F0;&#1F1ED;|cambodia, flag, other|
|🇰🇮|Flag for Kiribati|U+1F1F0 U+1F1EE|&#1F1F0;&#1F1EE;|flag, kiribati, other|
|🇰🇲|Flag for Comoros|U+1F1F0 U+1F1F2|&#1F1F0;&#1F1F2;|comoros, flag, other|
|🇰🇳|Flag for St. Kitts & Nevis|U+1F1F0 U+1F1F3|&#1F1F0;&#1F1F3;|flag, kitts, nevis, other, saint|
|🇰🇵|Flag for North Korea|U+1F1F0 U+1F1F5|&#1F1F0;&#1F1F5;|flag, korea, north, north korea, other|
|🇰🇷|Flag for South Korea|U+1F1F0 U+1F1F7|&#1F1F0;&#1F1F7;|flag, korea, other, south, south korea|
|🇰🇼|Flag for Kuwait|U+1F1F0 U+1F1FC|&#1F1F0;&#1F1FC;|flag, kuwait, other|
|🇰🇾|Flag for Cayman Islands|U+1F1F0 U+1F1FE|&#1F1F0;&#1F1FE;|cayman, flag, island, other|
|🇰🇿|Flag for Kazakhstan|U+1F1F0 U+1F1FF|&#1F1F0;&#1F1FF;|flag, kazakhstan, other|
|🇱🇦|Flag for Laos|U+1F1F1 U+1F1E6|&#1F1F1;&#1F1E6;|flag, laos, other|
|🇱🇧|Flag for Lebanon|U+1F1F1 U+1F1E7|&#1F1F1;&#1F1E7;|flag, lebanon, other|
|🇱🇨|Flag for St. Lucia|U+1F1F1 U+1F1E8|&#1F1F1;&#1F1E8;|flag, lucia, other, saint|
|🇱🇮|Flag for Liechtenstein|U+1F1F1 U+1F1EE|&#1F1F1;&#1F1EE;|flag, liechtenstein, other|
|🇱🇰|Flag for Sri Lanka|U+1F1F1 U+1F1F0|&#1F1F1;&#1F1F0;|flag, other, sri lanka|
|🇱🇷|Flag for Liberia|U+1F1F1 U+1F1F7|&#1F1F1;&#1F1F7;|flag, liberia, other|
|🇱🇸|Flag for Lesotho|U+1F1F1 U+1F1F8|&#1F1F1;&#1F1F8;|flag, lesotho, other|
|🇱🇹|Flag for Lithuania|U+1F1F1 U+1F1F9|&#1F1F1;&#1F1F9;|flag, lithuania, other|
|🇱🇺|Flag for Luxembourg|U+1F1F1 U+1F1FA|&#1F1F1;&#1F1FA;|flag, luxembourg, other|
|🇱🇻|Flag for Latvia|U+1F1F1 U+1F1FB|&#1F1F1;&#1F1FB;|flag, latvia, other|
|🇱🇾|Flag for Libya|U+1F1F1 U+1F1FE|&#1F1F1;&#1F1FE;|flag, libya, other|
|🇲🇦|Flag for Morocco|U+1F1F2 U+1F1E6|&#1F1F2;&#1F1E6;|flag, morocco, other|
|🇲🇨|Flag for Monaco|U+1F1F2 U+1F1E8|&#1F1F2;&#1F1E8;|flag, monaco, other|
|🇲🇩|Flag for Moldova|U+1F1F2 U+1F1E9|&#1F1F2;&#1F1E9;|flag, moldova, other|
|🇲🇪|Flag for Montenegro|U+1F1F2 U+1F1EA|&#1F1F2;&#1F1EA;|flag, montenegro, other|
|🇲🇫|Flag for St. Martin|U+1F1F2 U+1F1EB|&#1F1F2;&#1F1EB;|flag, french, martin, other, saint|
|🇲🇬|Flag for Madagascar|U+1F1F2 U+1F1EC|&#1F1F2;&#1F1EC;|flag, madagascar, other|
|🇲🇭|Flag for Marshall Islands|U+1F1F2 U+1F1ED|&#1F1F2;&#1F1ED;|flag, island, marshall, other|
|🇲🇰|Flag for Macedonia|U+1F1F2 U+1F1F0|&#1F1F2;&#1F1F0;|flag, macedonia, other|
|🇲🇱|Flag for Mali|U+1F1F2 U+1F1F1|&#1F1F2;&#1F1F1;|flag, mali, other|
|🇲🇲|Flag for Myanmar|U+1F1F2 U+1F1F2|&#1F1F2;&#1F1F2;|burma, flag, myanmar, other|
|🇲🇳|Flag for Mongolia|U+1F1F2 U+1F1F3|&#1F1F2;&#1F1F3;|flag, mongolia, other|
|🇲🇴|Flag for Macau|U+1F1F2 U+1F1F4|&#1F1F2;&#1F1F4;|china, flag, macao, macau, other|
|🇲🇵|Flag for Northern Mariana Islands|U+1F1F2 U+1F1F5|&#1F1F2;&#1F1F5;|flag, island, mariana, north, northern mariana, other|
|🇲🇶|Flag for Martinique|U+1F1F2 U+1F1F6|&#1F1F2;&#1F1F6;|flag, martinique, other|
|🇲🇷|Flag for Mauritania|U+1F1F2 U+1F1F7|&#1F1F2;&#1F1F7;|flag, mauritania, other|
|🇲🇸|Flag for Montserrat|U+1F1F2 U+1F1F8|&#1F1F2;&#1F1F8;|flag, montserrat, other|
|🇲🇹|Flag for Malta|U+1F1F2 U+1F1F9|&#1F1F2;&#1F1F9;|flag, malta, other|
|🇲🇺|Flag for Mauritius|U+1F1F2 U+1F1FA|&#1F1F2;&#1F1FA;|flag, mauritius, other|
|🇲🇻|Flag for Maldives|U+1F1F2 U+1F1FB|&#1F1F2;&#1F1FB;|flag, maldives, other|
|🇲🇼|Flag for Malawi|U+1F1F2 U+1F1FC|&#1F1F2;&#1F1FC;|flag, malawi, other|
|🇲🇽|Flag for Mexico|U+1F1F2 U+1F1FD|&#1F1F2;&#1F1FD;|flag, mexico, other|
|🇲🇾|Flag for Malaysia|U+1F1F2 U+1F1FE|&#1F1F2;&#1F1FE;|flag, malaysia, other|
|🇲🇿|Flag for Mozambique|U+1F1F2 U+1F1FF|&#1F1F2;&#1F1FF;|flag, mozambique, other|
|🇳🇦|Flag for Namibia|U+1F1F3 U+1F1E6|&#1F1F3;&#1F1E6;|flag, namibia, other|
|🇳🇨|Flag for New Caledonia|U+1F1F3 U+1F1E8|&#1F1F3;&#1F1E8;|flag, new, new caledonia, other|
|🇳🇪|Flag for Niger|U+1F1F3 U+1F1EA|&#1F1F3;&#1F1EA;|flag, niger, other|
|🇳🇫|Flag for Norfolk Island|U+1F1F3 U+1F1EB|&#1F1F3;&#1F1EB;|flag, island, norfolk, other|
|🇳🇬|Flag for Nigeria|U+1F1F3 U+1F1EC|&#1F1F3;&#1F1EC;|flag, nigeria, other|
|🇳🇮|Flag for Nicaragua|U+1F1F3 U+1F1EE|&#1F1F3;&#1F1EE;|flag, nicaragua, other|
|🇳🇱|Flag for Netherlands|U+1F1F3 U+1F1F1|&#1F1F3;&#1F1F1;|flag, netherlands, other|
|🇳🇴|Flag for Norway|U+1F1F3 U+1F1F4|&#1F1F3;&#1F1F4;|flag, norway, other|
|🇳🇵|Flag for Nepal|U+1F1F3 U+1F1F5|&#1F1F3;&#1F1F5;|flag, nepal, other|
|🇳🇷|Flag for Nauru|U+1F1F3 U+1F1F7|&#1F1F3;&#1F1F7;|flag, nauru, other|
|🇳🇺|Flag for Niue|U+1F1F3 U+1F1FA|&#1F1F3;&#1F1FA;|flag, niue, other|
|🇳🇿|Flag for New Zealand|U+1F1F3 U+1F1FF|&#1F1F3;&#1F1FF;|flag, new, new zealand, other|
|🇴🇲|Flag for Oman|U+1F1F4 U+1F1F2|&#1F1F4;&#1F1F2;|flag, oman, other|
|🇵🇦|Flag for Panama|U+1F1F5 U+1F1E6|&#1F1F5;&#1F1E6;|flag, other, panama|
|🇵🇪|Flag for Peru|U+1F1F5 U+1F1EA|&#1F1F5;&#1F1EA;|flag, other, peru|
|🇵🇫|Flag for French Polynesia|U+1F1F5 U+1F1EB|&#1F1F5;&#1F1EB;|flag, french, other, polynesia|
|🇵🇬|Flag for Papua New Guinea|U+1F1F5 U+1F1EC|&#1F1F5;&#1F1EC;|flag, guinea, new, other, papua new guinea|
|🇵🇭|Flag for Philippines|U+1F1F5 U+1F1ED|&#1F1F5;&#1F1ED;|flag, other, philippines|
|🇵🇰|Flag for Pakistan|U+1F1F5 U+1F1F0|&#1F1F5;&#1F1F0;|flag, other, pakistan|
|🇵🇱|Flag for Poland|U+1F1F5 U+1F1F1|&#1F1F5;&#1F1F1;|flag, other, poland|
|🇵🇲|Flag for St. Pierre & Miquelon|U+1F1F5 U+1F1F2|&#1F1F5;&#1F1F2;|flag, miquelon, other, pierre, saint|
|🇵🇳|Flag for Pitcairn Islands|U+1F1F5 U+1F1F3|&#1F1F5;&#1F1F3;|flag, island, other, pitcairn|
|🇵🇷|Flag for Puerto Rico|U+1F1F5 U+1F1F7|&#1F1F5;&#1F1F7;|flag, other, puerto rico|
|🇵🇸|Flag for Palestinian Territories|U+1F1F5 U+1F1F8|&#1F1F5;&#1F1F8;|flag, other, palestine|
|🇵🇹|Flag for Portugal|U+1F1F5 U+1F1F9|&#1F1F5;&#1F1F9;|flag, other, portugal|
|🇵🇼|Flag for Palau|U+1F1F5 U+1F1FC|&#1F1F5;&#1F1FC;|flag, other, palau|
|🇵🇾|Flag for Paraguay|U+1F1F5 U+1F1FE|&#1F1F5;&#1F1FE;|flag, other, paraguay|
|🇶🇦|Flag for Qatar|U+1F1F6 U+1F1E6|&#1F1F6;&#1F1E6;|flag, other, qatar|
|🇷🇴|Flag for Romania|U+1F1F7 U+1F1F4|&#1F1F7;&#1F1F4;|flag, other, romania|
|🇷🇸|Flag for Serbia|U+1F1F7 U+1F1F8|&#1F1F7;&#1F1F8;|flag, other, serbia|
|🇷🇺|Flag for Russia|U+1F1F7 U+1F1FA|&#1F1F7;&#1F1FA;|flag, other, russia|
|🇷🇼|Flag for Rwanda|U+1F1F7 U+1F1FC|&#1F1F7;&#1F1FC;|flag, other, rwanda|
|🇸🇦|Flag for Saudi Arabia|U+1F1F8 U+1F1E6|&#1F1F8;&#1F1E6;|flag, other, saudi arabia|
|🇸🇧|Flag for Solomon Islands|U+1F1F8 U+1F1E7|&#1F1F8;&#1F1E7;|flag, island, other, solomon|
|🇸🇨|Flag for Seychelles|U+1F1F8 U+1F1E8|&#1F1F8;&#1F1E8;|flag, other, seychelles|
|🇸🇩|Flag for Sudan|U+1F1F8 U+1F1E9|&#1F1F8;&#1F1E9;|flag, other, sudan|
|🇸🇪|Flag for Sweden|U+1F1F8 U+1F1EA|&#1F1F8;&#1F1EA;|flag, other, sweden|
|🇸🇬|Flag for Singapore|U+1F1F8 U+1F1EC|&#1F1F8;&#1F1EC;|flag, other, singapore|
|🇸🇭|Flag for St. Helena|U+1F1F8 U+1F1ED|&#1F1F8;&#1F1ED;|flag, helena, other, saint|
|🇸🇮|Flag for Slovenia|U+1F1F8 U+1F1EE|&#1F1F8;&#1F1EE;|flag, other, slovenia|
|🇸🇯|Flag for Svalbard & Jan Mayen|U+1F1F8 U+1F1EF|&#1F1F8;&#1F1EF;|flag, jan mayen, other, svalbard|
|🇸🇰|Flag for Slovakia|U+1F1F8 U+1F1F0|&#1F1F8;&#1F1F0;|flag, other, slovakia|
|🇸🇱|Flag for Sierra Leone|U+1F1F8 U+1F1F1|&#1F1F8;&#1F1F1;|flag, other, sierra leone|
|🇸🇲|Flag for San Marino|U+1F1F8 U+1F1F2|&#1F1F8;&#1F1F2;|flag, other, san marino|
|🇸🇳|Flag for Senegal|U+1F1F8 U+1F1F3|&#1F1F8;&#1F1F3;|flag, other, senegal|
|🇸🇴|Flag for Somalia|U+1F1F8 U+1F1F4|&#1F1F8;&#1F1F4;|flag, other, somalia|
|🇸🇷|Flag for Suriname|U+1F1F8 U+1F1F7|&#1F1F8;&#1F1F7;|flag, other, suriname|
|🇸🇸|Flag for South Sudan|U+1F1F8 U+1F1F8|&#1F1F8;&#1F1F8;|flag, other, south, south sudan, sudan|
|🇸🇻|Flag for El Salvador|U+1F1F8 U+1F1FB|&#1F1F8;&#1F1FB;|el salvador, flag, other|
|🇸🇽|Flag for Sint Maarten|U+1F1F8 U+1F1FD|&#1F1F8;&#1F1FD;|flag, maarten, other, sint|
|🇸🇾|Flag for Syria|U+1F1F8 U+1F1FE|&#1F1F8;&#1F1FE;|flag, other, syria|
|🇸🇿|Flag for Swaziland|U+1F1F8 U+1F1FF|&#1F1F8;&#1F1FF;|flag, other, swaziland|
|🇹🇦|Flag for Tristan da Cunha|U+1F1F9 U+1F1E6|&#1F1F9;&#1F1E6;|flag, other, tristan da cunha|
|🇹🇨|Flag for Turks & Caicos Islands|U+1F1F9 U+1F1E8|&#1F1F9;&#1F1E8;|caicos, flag, island, other, turks|
|🇹🇩|Flag for Chad|U+1F1F9 U+1F1E9|&#1F1F9;&#1F1E9;|chad, flag, other|
|🇹🇫|Flag for French Southern Territories|U+1F1F9 U+1F1EB|&#1F1F9;&#1F1EB;|antarctic, flag, french, other|
|🇹🇬|Flag for Togo|U+1F1F9 U+1F1EC|&#1F1F9;&#1F1EC;|flag, other, togo|
|🇹🇭|Flag for Thailand|U+1F1F9 U+1F1ED|&#1F1F9;&#1F1ED;|flag, other, thailand|
|🇹🇯|Flag for Tajikistan|U+1F1F9 U+1F1EF|&#1F1F9;&#1F1EF;|flag, other, tajikistan|
|🇹🇰|Flag for Tokelau|U+1F1F9 U+1F1F0|&#1F1F9;&#1F1F0;|flag, other, tokelau|
|🇹🇱|Flag for Timor-Leste|U+1F1F9 U+1F1F1|&#1F1F9;&#1F1F1;|east, east timor, flag, other, timor-leste|
|🇹🇲|Flag for Turkmenistan|U+1F1F9 U+1F1F2|&#1F1F9;&#1F1F2;|flag, other, turkmenistan|
|🇹🇳|Flag for Tunisia|U+1F1F9 U+1F1F3|&#1F1F9;&#1F1F3;|flag, other, tunisia|
|🇹🇴|Flag for Tonga|U+1F1F9 U+1F1F4|&#1F1F9;&#1F1F4;|flag, other, tonga|
|🇹🇷|Flag for Turkey|U+1F1F9 U+1F1F7|&#1F1F9;&#1F1F7;|flag, other, turkey|
|🇹🇹|Flag for Trinidad & Tobago|U+1F1F9 U+1F1F9|&#1F1F9;&#1F1F9;|flag, other, tobago, trinidad|
|🇹🇻|Flag for Tuvalu|U+1F1F9 U+1F1FB|&#1F1F9;&#1F1FB;|flag, other, tuvalu|
|🇹🇼|Flag for Taiwan|U+1F1F9 U+1F1FC|&#1F1F9;&#1F1FC;|china, flag, other, taiwan|
|🇹🇿|Flag for Tanzania|U+1F1F9 U+1F1FF|&#1F1F9;&#1F1FF;|flag, other, tanzania|
|🇺🇦|Flag for Ukraine|U+1F1FA U+1F1E6|&#1F1FA;&#1F1E6;|flag, other, ukraine|
|🇺🇬|Flag for Uganda|U+1F1FA U+1F1EC|&#1F1FA;&#1F1EC;|flag, other, uganda|
|🇺🇲|Flag for U.S. Outlying Islands|U+1F1FA U+1F1F2|&#1F1FA;&#1F1F2;|america, flag, island, minor outlying, other, united, united states, us, usa|
|🇺🇸|Flag for United States|U+1F1FA U+1F1F8|&#1F1FA;&#1F1F8;|america, flag, other, stars and stripes, united, united states|
|🇺🇾|Flag for Uruguay|U+1F1FA U+1F1FE|&#1F1FA;&#1F1FE;|flag, other, uruguay|
|🇺🇿|Flag for Uzbekistan|U+1F1FA U+1F1FF|&#1F1FA;&#1F1FF;|flag, other, uzbekistan|
|🇻🇦|Flag for Vatican City|U+1F1FB U+1F1E6|&#1F1FB;&#1F1E6;|flag, other, vatican|
|🇻🇨|Flag for St. Vincent & Grenadines|U+1F1FB U+1F1E8|&#1F1FB;&#1F1E8;|flag, grenadines, other, saint, vincent|
|🇻🇪|Flag for Venezuela|U+1F1FB U+1F1EA|&#1F1FB;&#1F1EA;|flag, other, venezuela|
|🇻🇬|Flag for British Virgin Islands|U+1F1FB U+1F1EC|&#1F1FB;&#1F1EC;|british, flag, island, other, virgin|
|🇻🇮|Flag for U.S. Virgin Islands|U+1F1FB U+1F1EE|&#1F1FB;&#1F1EE;|america, american, flag, island, other, united, united states, us, usa, virgin|
|🇻🇳|Flag for Vietnam|U+1F1FB U+1F1F3|&#1F1FB;&#1F1F3;|flag, other, viet nam, vietnam|
|🇻🇺|Flag for Vanuatu|U+1F1FB U+1F1FA|&#1F1FB;&#1F1FA;|flag, other, vanuatu|
|🇼🇫|Flag for Wallis & Futuna|U+1F1FC U+1F1EB|&#1F1FC;&#1F1EB;|flag, futuna, other, wallis|
|🇼🇸|Flag for Samoa|U+1F1FC U+1F1F8|&#1F1FC;&#1F1F8;|flag, other, samoa|
|🇽🇰|Flag for Kosovo|U+1F1FD U+1F1F0|&#1F1FD;&#1F1F0;|flag, kosovo, other|
|🇾🇪|Flag for Yemen|U+1F1FE U+1F1EA|&#1F1FE;&#1F1EA;|flag, other, yemen|
|🇾🇹|Flag for Mayotte|U+1F1FE U+1F1F9|&#1F1FE;&#1F1F9;|flag, mayotte, other|
|🇿🇦|Flag for South Africa|U+1F1FF U+1F1E6|&#1F1FF;&#1F1E6;|flag, other, south, south africa|
|🇿🇲|Flag for Zambia|U+1F1FF U+1F1F2|&#1F1FF;&#1F1F2;|flag, other, zambia|
|🇿🇼|Flag for Zimbabwe|U+1F1FF U+1F1FC|&#1F1FF;&#1F1FC;|flag, other, zimbabwe|



