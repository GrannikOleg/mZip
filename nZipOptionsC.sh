#!/bin/bash
source "sZip.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
 HEAD()
{
 for (( a=2; a<=29; a++ ))
  do
   TPUT $a 1
    $E "$na";
  done
TPUT  1 1;$E "$nb";UNMARK;
TPUT  2 2;$E "\e[36m Options\e[0m                                                      \e[2m Параметры, Опции\e[0m";
TPUT  3 1;$E "$nc";
TPUT 28 1;$E "$nd";
}
 FOOT(){ MARK;TPUT 30 1;$E "$ne";UNMARK;}
#
  M0(){ TPUT  4 3; $e "Включите различные подробные сообщения                  \e[32m -sv --split-verbose \e[0m";}
  M1(){ TPUT  5 3; $e "Включить системные и скрытые файлы                       \e[32m -S --system-hidden \e[0m";}
  M2(){ TPUT  6 3; $e "Не работать с файлами, измененными до даты \e[32m -t mmddyyyy --from-date mmddyyyy \e[0m";}
  M3(){ TPUT  7 3; $e "Не работать с файлами, указанной даты   \e[32m -tt mmddyyyy --before-date mmddyyyy \e[0m";}
  M4(){ TPUT  8 3; $e "Проверьте целостность нового zip-файла                            \e[32m -T --test \e[0m";}
  M5(){ TPUT  9 3; $e "Используйте команду cmd вместо unzip -tqq       \e[32m -TT cmd --unzip-command cmd \e[0m";}
  M6(){ TPUT 10 3; $e "Заменять (обновлять) существующую запись в zip-архиве           \e[32m -u --update \e[0m";}
  M7(){ TPUT 11 3; $e "Копировать записи из одного архива в другой               \e[32m -U --copy-entries \e[0m";}
  M8(){ TPUT 12 3; $e "Определите, что zip должен делать с именами файлов Unicode\e[32m -UN v --unicode v \e[0m";}
  M9(){ TPUT 13 3; $e "Подробный режим распечатать информацию о диагностической версии\e[32m -v --verbose \e[0m";}
 M10(){ TPUT 14 3; $e "Сохранение атрибутов файла VMS                            \e[32m -V --VMS-portable \e[0m";}
 M11(){ TPUT 15 3; $e "Сохранение атрибутов файла VMS и выделенных блоков в файл\e[32m -VV --VMS-specific \e[0m";}
 M12(){ TPUT 16 3; $e "Добавление номера версии файлов к имени                   \e[32m -w --VMS-versions \e[0m";}
 M13(){ TPUT 17 3; $e "Добавляйте к имени номер версии файлов               \e[32m -ww --VMS-dot-versions \e[0m";}
 M14(){ TPUT 18 3; $e "Подстановочные знаки совпадают только уровня каталога  \e[32m -ws --wild-stop-dirs \e[0m";}
 M15(){ TPUT 19 3; $e "Явно исключить указанные файлы                     \e[32m -x files --exclude files \e[0m";}
 M16(){ TPUT 20 3; $e "Не сохраняйте дополнительные атрибуты файла                   \e[32m -X --no-extra \e[0m";}
 M17(){ TPUT 21 3; $e "Для UNIX и VMS (версия 8.3 и более поздние)                   \e[32m -y --symlinks \e[0m";}
 M18(){ TPUT 22 3; $e "Запрашивать многострочный комментарий для zip-архива   \e[32m -z --archive-comment \e[0m";}
 M19(){ TPUT 23 3; $e "Установите метод сжатия по умолчанию          \e[32m -Z cm --compression-method cm \e[0m";}
 M20(){ TPUT 24 3; $e "Регулируйте скорость сжатия     \e[32m -# (-0, -1, -2, -3, -4, -5, -6, -7, -8, -9) \e[0m";}
 M21(){ TPUT 25 3; $e "Используйте привилегии (если они предоставлены)         \e[32m -! --use-privileges \e[0m";}
 M22(){ TPUT 26 3; $e "Возьмите список входных файлов из стандартного ввода       \e[32m -@ --names-stdin \e[0m";}
 M23(){ TPUT 27 3; $e "Включите метку тома для диска                             \e[32m -$ --volume-label \e[0m";}
 M24(){ TPUT 29 3; $e "Exit                                                                         ";}
LM=24
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 Включите различные подробные сообщения во время разделения,
 показывающие, как выполняется разделение.
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 [MSDOS, OS/2, WIN32 и ATARI] Включить системные и скрытые файлы.
 [MacOS] Включает невидимые файлы Finder, которые в противном случае игнорируются.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Не работать с файлами, измененными до указанной даты,
 где мм — месяц (00–12), дд — день месяца (01–31), а гггг — год.
 Формат даты ISO 8601 yyyy-mm-dd также принимается. Например:
\e[32m zip -rt 12071991 infamy foo\e[0m
\e[32m zip -rt 1991-12-07 infamy foo\e[0m
 добавит все файлы в foo и его подкаталогах, которые в последний раз изменялись
 7 декабря 1991 года или позднее, в zip-архив infamy.zip.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Не работать с файлами, измененными после или в указанную дату,
 где мм — месяц (00–12), дд — день месяца (01–31), а гггг — год.
 Формат даты ISO 8601 yyyy-mm-dd также принимается. Например:
\e[32m zip -rtt 11301995 infamy foo\e[0m
\e[32m zip -rtt 1995-11-30 infamy foo\e[0m
 добавит все файлы в foo и его подкаталогах,
 которые последний раз изменялись до 30 ноября 1995 года, в zip-архив infamy.zip
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Проверьте целостность нового zip-файла. Если проверка не пройдена,
 старый zip-файл остается неизменным и (с опцией -m) входные файлы не удаляются.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Используйте команду cmd вместо «unzip -tqq», чтобы проверить архив, когда
 используется опция -T. В Unix, чтобы использовать копию unzip в текущем каталоге
 вместо стандартной системной распаковки, можно использовать:
\e[32m \e[0m
 В cmd {} заменяется именем временного архива, в противном случае имя архива
 добавляется в конец команды. Код возврата проверяется на успех (0 в Unix).
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Заменять (обновлять) существующую запись в zip-архиве только в том случае,
 если она была изменена позднее, чем версия, уже находящаяся в zip-архиве.
 Например:\e[32m zip -u stuff *\e[0m
 добавит любые новые файлы в текущий каталог и обновит все файлы, которые были
 изменены с момента последнего создания/изменения zip-архива stuff.zip
 (обратите внимание, что zip не будет пытаться упаковать stuff.zip в себя,
 когда вы это сделаете). Обратите внимание, что параметр -u без аргументов
 входного файла действует так же, как параметр -f (freshen).
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Копировать записи из одного архива в другой.
 Требуется параметр --out для указания выходного файла, отличного от входного
 архива. Режим копирования противоположен -d delete. Когда удаление используется
 с --out, выбранные записи удаляются из архива, а все остальные записи копируются
 в новый архив, а режим копирования выбирает файлы для включения в новый архив.
 В отличие от -u update шаблоны ввода в командной строке сопоставляются только
 с записями архива, а не с файлами файловой системы. Например:
\e[32m zip inarchive \"*.c\" --copy --out outarchive\e[0m
 копирует записи с именами, оканчивающимися на .c, из inarchive в outarchive.
 В некоторых системах необходимо экранировать подстановочный знак, чтобы оболочка
 не подставляла имена файлов из файловой системы, которые могут не иметь отношения
 к записям в архиве. Если в командной строке не отображаются входные файлы
 и используется параметр --out, предполагается режим копирования:
\e[32m zip inarchive --out outarchive\e[0m
 Это полезно, например, для изменения размера разделения.
 Шифрование и дешифрование записей пока не поддерживается в режиме копирования.
 Используйте для этого zipcloak.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Определите, что zip должен делать с именами файлов Unicode. zip 3.0,
 в дополнение к стандартному пути к файлу, теперь включает перевод пути UTF-8, если
 путь входа не полностью 7-битный ASCII. Если в записи отсутствует путь Unicode,
 zip возвращается к стандартному пути к файлу. Проблема с использованием
 стандартного пути заключается в том, что этот путь находится в локальном наборе
 символов почтового индекса, создавшего запись, который может содержать символы,
 недопустимые в наборе символов, используемом при распаковке.
 Когда zip читает архив, если запись также имеет путь Unicode,
 zip теперь по умолчанию использует путь Unicode для воссоздания стандартного пути
 с использованием текущего локального набора символов.
 Этот параметр можно использовать для определения того, что zip должен делать
 с этим путем, если существует несоответствие между сохраненным стандартным путем
 и сохраненным путем UTF-8 (что может произойти, если стандартный путь был
 обновлен). Во всех случаях, если есть несоответствие, предполагается,
 что стандартный путь более актуален, и zip использует его. Значения для v:
\e[32m q\e[0m - выйти, если пути не совпадают
\e[32m w\e[0m - предупредить, продолжить по стандартному пути
\e[32m i\e[0m - игнорировать, продолжить по стандартному пути
\e[32m n\e[0m - нет Unicode, не использовать пути Unicode
 По умолчанию предупреждение и продолжение.
 Символы, недопустимые в текущем наборе символов, экранируются как
 #Uxxxx и #Lxxxxxx,
 где x — это символ ASCII для шестнадцатеричной цифры.
 Первый используется, если 16-битного номера символа достаточно для представления
 символа Unicode, а второй, если символу требуется более 16 бит для представления
 его кода символа Unicode. Установка -UN в
\e[32m e - escape\e[0m
 как в
\e[32m zip archive -sU -UN=e\e[0m
 заставляет zip экранировать все символы, которые не могут быть напечатаны
 7-битным ASCII. Обычно zip сохраняет UTF-8 непосредственно в поле стандартного
 пути в системах, где UTF-8 является текущим набором символов,
 и в противном случае сохраняет UTF-8 в новых дополнительных полях. Опция
\e[32m u - UTF-8\e[0m
 как в
\e[32m zip archive dir -r -UN=UTF8\e[0m
 заставляет zip хранить кодировку UTF-8 как нативную в архиве. Обратите внимание,
 что сохранение UTF-8 напрямую используется по умолчанию в системах Unix, которые
 его поддерживают. Этот параметр может быть полезен в системах Windows,
 где экранированный путь слишком велик, чтобы быть допустимым путем,
 а версия пути UTF-8 меньше,
 но собственная UTF-8 не имеет обратной совместимости в системах Windows.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Подробный режим или распечатать информацию о диагностической версии.
 Обычно применительно к реальным операциям этот параметр включает отображение
 индикатора выполнения во время сжатия (см. -dd для получения дополнительной
 информации о точках) и запрашивает подробную диагностическую информацию о
 странностях структуры zip-файла. Однако, когда -v является единственным
 аргументом командной строки, вместо этого печатается диагностический экран.
 Теперь это должно работать, даже если стандартный вывод перенаправляется в файл,
 что позволяет легко сохранять информацию для отправки с отчетами об ошибках
 в Info-ZIP. Экран версии содержит заголовок экрана справки с названием программы,
 версией и датой выпуска, некоторыми указателями на домашний и дистрибутивный
 сайты Info-ZIP, а также показывает информацию о целевой среде (тип и версия
 компилятора, версия ОС, дата компиляции и включены дополнительные функции,
 используемые для создания исполняемого файла zip).
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 [VMS] Сохранение атрибутов файла VMS. (Файлы усекаются в EOF.)
 Когда архив -V распаковывается в системе, отличной от VMS, некоторые типы файлов
 (особенно текстовые файлы Stream_LF и чистые двоичные файлы, такие как fixed-512)
 должны быть извлечены без изменений. Индексированные файлы и типы файлов со
 встроенными размерами записей (особенно типы записей переменной длины),
 вероятно, будут рассматриваться как поврежденные в другом месте.
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 [VMS] Сохранение атрибутов файла VMS и всех выделенных блоков в файле, включая
 любые данные за пределами EOF. Полезно для перемещения файлов неправильного
 формата между системами VMS. Когда архив -VV распаковывается в системе,
 отличной от VMS, почти все файлы будут повреждены.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 [VMS] Добавление номера версии файлов к имени, включая несколько версий файлов.
 По умолчанию используется только самая последняя версия указанного файла.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 [VMS] Добавляйте к имени номер версии файлов, включая несколько версий файлов,
 используя формат .nnn
 По умолчанию используется только самая последняя версия указанного файла.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Подстановочные знаки совпадают только на уровне каталога.
 Обычно zip обрабатывает пути как строки и учитывая пути
\e[32m /foo/bar/dir/file1.c\e[0m
\e[32m /foo/bar/file2.c\e[0m
 шаблон ввода, такой как
\e[32m /foo/bar/*\e[0m
 обычно соответствуют обоим путям, * соответствующим dir/file1.c и file2.c.
 Обратите внимание, что в первом случае при совпадении была пересечена граница
 каталога (/). С параметром -ws никакие границы каталогов не будут включены в
 сопоставление, что делает подстановочные знаки локальными для определенного
 уровня каталога. Таким образом, при включенном параметре -ws совпадет только
 второй путь. При использовании -ws используйте ** для соответствия между
 границами каталога, как это обычно делает *.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Явно исключить указанные файлы, например:
\e[32m zip -r foo foo -x \\*.o\e[0m
 который будет включать содержимое foo в foo.zip, исключая все файлы,
 оканчивающиеся на .o Обратная косая черта позволяет избежать замены имени файла
 оболочки, поэтому сопоставление имен выполняется zip на всех уровнях каталога.
 Также возможно:\e[32m zip -r foo foo -x@exclude.lst\e[0m
 который будет включать содержимое foo в foo.zip, исключая все файлы,
 соответствующие шаблонам в файле exclude.lst.
 Формы длинного опциона из вышеперечисленного:\e[32m zip -r foo foo --exclude \*.o\e[0m
 and\e[32m zip -r foo foo --exclude @exclude.lst\e[0m
 Можно указать несколько шаблонов, например:
\e[32m zip -r foo foo -x \\*.o \\*.c\e[0m
 Если между -x и шаблоном нет пробела, предполагается только одно значение
 (без списка):\e[32m zip -r foo foo -x\\*.o\e[0m
 См. -i для получения дополнительной информации о включении и исключении.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Не сохраняйте дополнительные атрибуты файла
 (расширенные атрибуты в OS/2, uid/gid и время файла в Unix).
 Формат zip использует дополнительные поля для включения дополнительной информации
 для каждой записи. Некоторые дополнительные поля относятся к конкретным системам,
 в то время как другие применимы ко всем системам. Обычно, когда zip читает записи
 из существующего архива, он считывает известные ему дополнительные поля, удаляет
 остальные и добавляет дополнительные поля, применимые к этой системе.
 С -X zip удаляет все старые поля и включает только дополнительные поля Unicode
 и Zip64 (в настоящее время эти два дополнительных поля нельзя отключить).
 Отрицая эту опцию, -X- включает все дополнительные поля по умолчанию,
 но также копирует любые нераспознанные дополнительные поля.
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Для UNIX и VMS (версия 8.3 и более поздние) сохраняйте символические ссылки
 как таковые в zip-архиве вместо того, чтобы сжимать и сохранять файл, на который
 ссылается ссылка. Это позволяет избежать включения нескольких копий файлов в
 архив, поскольку zip рекурсивно повторяет деревья каталогов
 и обращается к файлам напрямую и по ссылкам.
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Запрашивать многострочный комментарий для всего zip-архива.
 Комментарий заканчивается строкой, содержащей только точку или условие конца файла
 (^D в Unix, ^Z в MSDOS, OS/2 и VMS). Комментарий можно взять из файла:
\e[32m zip -z foo < foowhat\e[0m
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Установите метод сжатия по умолчанию.

 Чтобы указать метод сжатия, используйте -Z опцию:
\e[32m zip -r -Z bzip2 archivename.zip directory_name\e[0m

 В настоящее время основными методами, поддерживаемыми zip, являются store
 и deflate. Метод сжатия может быть установлен на:
\e[32m store\e[0m - Установка метода сжатия для сохранения заставляет zip сохранять записи без
 сжатия. Обычно это быстрее, чем сжатие записей, но не приводит к экономии места.
 Это то же самое, что и использование -0 (нулевой уровень сжатия).
\e[32m deflate\e[0m — это метод по умолчанию для zip.
 Если zip определяет, что сохранение лучше, чем дефляция, запись будет сохранена.
\e[32m bzip2\e[0m — если скомпилирована поддержка bzip2, этот метод сжатия также становится
 доступным. Только некоторые современные распаковщики в настоящее время
 поддерживают метод сжатия bzip2, поэтому проверьте распаковку, которую вы будете
 использовать, прежде чем полагаться на архивы, использующие этот метод
 (метод сжатия 12).
 Например, чтобы добавить bar.c в архив foo, используя сжатие bzip2:
\e[32m zip -Z bzip2 foo bar.c\e[0m
 Метод сжатия может быть сокращен:
\e[32m zip -Zb foo bar.c\e[0m
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Регулируйте скорость сжатия с помощью указанной цифры #, где:
\e[32m -0\e[0m указывает на отсутствие сжатия (сохранение всех файлов),
\e[32m -1\e[0m указывает на самую высокую скорость сжатия (меньшее сжатие) и
\e[32m -6\e[0m (оптимальное сжатие, игнорирует список суффиксов).
 Уровень сжатия по умолчанию равен -6.
\e[32m -9\e[0m наилучший степень сжатия
 Несмотря на то, что все еще ведется работа, предполагается, что этот параметр
 будет контролировать скорость сжатия для всех методов сжатия.
 В настоящее время контролируется только дефляция.
";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "
 [WIN32] Используйте привилегии (если они предоставлены)
 для получения всех аспектов безопасности WinNT.
";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "
 Возьмите список входных файлов из стандартного ввода.
 Только одно имя файла в строке.
";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 [MSDOS, OS/2, WIN32] Включите метку тома для диска, содержащего первый сжимаемый
 файл. Если вы хотите включить только метку тома или указать определенный диск,
 используйте имя диска в качестве первого имени файла, например:
\e[32m zip -$ foo a: c:bar\e[0m
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done
