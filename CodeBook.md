## ----------------------------------------------------------------------------------------
## Getting and Cleaning Data
## Week 4 Assessment
## B McLeod
## 28/05/2016
## ----------------------------------------------------------------------------------------

## This file describes the variables, the data, and any transformations performed to clean up the data.



## ----------------------------------------------------------------------------------------
## Variables
## ----------------------------------------------------------------------------------------
## fileUrl is the data source accessed via HTTPS
## week4data.zip is the downloaded file
## test_x_data is self explanatory
## test_y_data is self explanatory
## test_subject_data is self explanatory
## train_x_data is self explanatory
## train_y_data is self explanatory
## train_subject_data is self explanatory
## feature_data is self explanatory
## activity_data is self explanatory
## x_data is a combination of x training and test data
## y_data is a combination of y training and test data
## subject_data is a combination of subject training and test data
## indices are the data set columns we want to extract
## mean_std_data is the extract of data of interest which is then better named
## tidy_data is the desired results of the exercise



## ----------------------------------------------------------------------------------------
## Transformations
## ----------------------------------------------------------------------------------------
## Selecting columns from data sets, combining rows from data sets, stripping brackets from strings,
## replacing underscores with spaces



## ----------------------------------------------------------------------------------------
## The Tidy Data
## ----------------------------------------------------------------------------------------
> names(tidy_data)
 [1] "subject"                   "activity"                  "tBodyAcc-mean-X"           "tBodyAcc-mean-Y"          
 [5] "tBodyAcc-mean-Z"           "tBodyAcc-std-X"            "tBodyAcc-std-Y"            "tBodyAcc-std-Z"           
 [9] "tGravityAcc-mean-X"        "tGravityAcc-mean-Y"        "tGravityAcc-mean-Z"        "tGravityAcc-std-X"        
[13] "tGravityAcc-std-Y"         "tGravityAcc-std-Z"         "tBodyAccJerk-mean-X"       "tBodyAccJerk-mean-Y"      
[17] "tBodyAccJerk-mean-Z"       "tBodyAccJerk-std-X"        "tBodyAccJerk-std-Y"        "tBodyAccJerk-std-Z"       
[21] "tBodyGyro-mean-X"          "tBodyGyro-mean-Y"          "tBodyGyro-mean-Z"          "tBodyGyro-std-X"          
[25] "tBodyGyro-std-Y"           "tBodyGyro-std-Z"           "tBodyGyroJerk-mean-X"      "tBodyGyroJerk-mean-Y"     
[29] "tBodyGyroJerk-mean-Z"      "tBodyGyroJerk-std-X"       "tBodyGyroJerk-std-Y"       "tBodyGyroJerk-std-Z"      
[33] "tBodyAccMag-mean"          "tBodyAccMag-std"           "tGravityAccMag-mean"       "tGravityAccMag-std"       
[37] "tBodyAccJerkMag-mean"      "tBodyAccJerkMag-std"       "tBodyGyroMag-mean"         "tBodyGyroMag-std"         
[41] "tBodyGyroJerkMag-mean"     "tBodyGyroJerkMag-std"      "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"          
[45] "fBodyAcc-mean-Z"           "fBodyAcc-std-X"            "fBodyAcc-std-Y"            "fBodyAcc-std-Z"           
[49] "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"       "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"       
[53] "fBodyAccJerk-std-Y"        "fBodyAccJerk-std-Z"        "fBodyGyro-mean-X"          "fBodyGyro-mean-Y"         
[57] "fBodyGyro-mean-Z"          "fBodyGyro-std-X"           "fBodyGyro-std-Y"           "fBodyGyro-std-Z"          
[61] "fBodyAccMag-mean"          "fBodyAccMag-std"           "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"  
[65] "fBodyBodyGyroMag-mean"     "fBodyBodyGyroMag-std"      "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std" 



> head(tidy_data)
    subject           activity tBodyAcc-mean-X tBodyAcc-mean-Y tBodyAcc-mean-Z tBodyAcc-std-X tBodyAcc-std-Y
1         1             LAYING       0.2215982    -0.040513953      -0.1132036    -0.92805647   -0.836827406
31        1            SITTING       0.2612376    -0.001308288      -0.1045442    -0.97722901   -0.922618642
61        1           STANDING       0.2789176    -0.016137590      -0.1106018    -0.99575990   -0.973190056
91        1            WALKING       0.2773308    -0.017383819      -0.1111481    -0.28374026    0.114461337
121       1 WALKING DOWNSTAIRS       0.2891883    -0.009918505      -0.1075662     0.03003534   -0.031935943
151       1   WALKING UPSTAIRS       0.2554617    -0.023953149      -0.0973020    -0.35470803   -0.002320265
    tBodyAcc-std-Z tGravityAcc-mean-X tGravityAcc-mean-Y tGravityAcc-mean-Z tGravityAcc-std-X tGravityAcc-std-Y
1      -0.82606140         -0.2488818          0.7055498         0.44581772        -0.8968300        -0.9077200
31     -0.93958629          0.8315099          0.2044116         0.33204370        -0.9684571        -0.9355171
61     -0.97977588          0.9429520         -0.2729838         0.01349058        -0.9937630        -0.9812260
91     -0.26002790          0.9352232         -0.2821650        -0.06810286        -0.9766096        -0.9713060
121    -0.23043421          0.9318744         -0.2666103        -0.06211996        -0.9505598        -0.9370187
151    -0.01947924          0.8933511         -0.3621534        -0.07540294        -0.9563670        -0.9528492
    tGravityAcc-std-Z tBodyAccJerk-mean-X tBodyAccJerk-mean-Y tBodyAccJerk-mean-Z tBodyAccJerk-std-X tBodyAccJerk-std-Y
1          -0.8523663          0.08108653        0.0038382040         0.010834236        -0.95848211         -0.9241493
31         -0.9490409          0.07748252       -0.0006191028        -0.003367792        -0.98643071         -0.9813720
61         -0.9763241          0.07537665        0.0079757309        -0.003685250        -0.99460454         -0.9856487
91         -0.9477172          0.07404163        0.0282721096        -0.004168406        -0.11361560          0.0670025
121        -0.8959397          0.05415532        0.0296504490        -0.010971973        -0.01228386         -0.1016014
151        -0.9123794          0.10137273        0.0194863076        -0.045562545        -0.44684389         -0.3782744
    tBodyAccJerk-std-Z tBodyGyro-mean-X tBodyGyro-mean-Y tBodyGyro-mean-Z tBodyGyro-std-X tBodyGyro-std-Y tBodyGyro-std-Z
1           -0.9548551      -0.01655309      -0.06448612       0.14868944      -0.8735439    -0.951090440      -0.9082847
31          -0.9879108      -0.04535006      -0.09192415       0.06293138      -0.9772113    -0.966473895      -0.9414259
61          -0.9922512      -0.02398773      -0.05939722       0.07480075      -0.9871919    -0.987734440      -0.9806456
91          -0.5026998      -0.04183096      -0.06953005       0.08494482      -0.4735355    -0.054607769      -0.3442666
121         -0.3457350      -0.03507819      -0.09093713       0.09008501      -0.4580305    -0.126349195      -0.1247025
151         -0.7065935       0.05054938      -0.16617002       0.05835955      -0.5448711     0.004105184      -0.5071687
    tBodyGyroJerk-mean-X tBodyGyroJerk-mean-Y tBodyGyroJerk-mean-Z tBodyGyroJerk-std-X tBodyGyroJerk-std-Y
1            -0.10727095          -0.04151729          -0.07405012          -0.9186085          -0.9679072
31           -0.09367938          -0.04021181          -0.04670263          -0.9917316          -0.9895181
61           -0.09960921          -0.04406279          -0.04895055          -0.9929451          -0.9951379
91           -0.08999754          -0.03984287          -0.04613093          -0.2074219          -0.3044685
121          -0.07395920          -0.04399028          -0.02704611          -0.4870273          -0.2388248
151          -0.12223277          -0.04214859          -0.04071255          -0.6147865          -0.6016967
    tBodyGyroJerk-std-Z tBodyAccMag-mean tBodyAccMag-std tGravityAccMag-mean tGravityAccMag-std tBodyAccJerkMag-mean
1            -0.9577902      -0.84192915     -0.79514486         -0.84192915        -0.79514486          -0.95439626
31           -0.9879358      -0.94853679     -0.92707842         -0.94853679        -0.92707842          -0.98736420
61           -0.9921085      -0.98427821     -0.98194293         -0.98427821        -0.98194293          -0.99236779
91           -0.4042555      -0.13697118     -0.21968865         -0.13697118        -0.21968865          -0.14142881
121          -0.2687615       0.02718829      0.01988435          0.02718829         0.01988435          -0.08944748
151          -0.6063320      -0.12992763     -0.32497093         -0.12992763        -0.32497093          -0.46650345
    tBodyAccJerkMag-std tBodyGyroMag-mean tBodyGyroMag-std tBodyGyroJerkMag-mean tBodyGyroJerkMag-std fBodyAcc-mean-X
1           -0.92824563       -0.87475955       -0.8190102            -0.9634610           -0.9358410     -0.93909905
31          -0.98412002       -0.93089249       -0.9345318            -0.9919763           -0.9883087     -0.97964124
61          -0.99309621       -0.97649379       -0.9786900            -0.9949668           -0.9947332     -0.99524993
91          -0.07447175       -0.16097955       -0.1869784            -0.2987037           -0.3253249     -0.20279431
121         -0.02578772       -0.07574125       -0.2257244            -0.2954638           -0.3065106      0.03822918
151         -0.47899162       -0.12673559       -0.1486193            -0.5948829           -0.6485530     -0.40432178
    fBodyAcc-mean-Y fBodyAcc-mean-Z fBodyAcc-std-X fBodyAcc-std-Y fBodyAcc-std-Z fBodyAccJerk-mean-X fBodyAccJerk-mean-Y
1      -0.867065205      -0.8826669    -0.92443743    -0.83362556    -0.81289156         -0.95707388         -0.92246261
31     -0.944084550      -0.9591849    -0.97641231    -0.91727501    -0.93446956         -0.98659702         -0.98157947
61     -0.977070848      -0.9852971    -0.99602835    -0.97229310    -0.97793726         -0.99463080         -0.98541870
91      0.089712726      -0.3315601    -0.31913472     0.05604001    -0.27968675         -0.17054696         -0.03522552
121     0.001549908      -0.2255745     0.02433084    -0.11296374    -0.29792789         -0.02766387         -0.12866716
151    -0.190976721      -0.4333497    -0.33742819     0.02176951     0.08595655         -0.47987525         -0.41344459
    fBodyAccJerk-mean-Z fBodyAccJerk-std-X fBodyAccJerk-std-Y fBodyAccJerk-std-Z fBodyGyro-mean-X fBodyGyro-mean-Y
1            -0.9480609         -0.9641607         -0.9322179         -0.9605870       -0.8502492      -0.95219149
31           -0.9860531         -0.9874930         -0.9825139         -0.9883392       -0.9761615      -0.97583859
61           -0.9907522         -0.9950738         -0.9870182         -0.9923498       -0.9863868      -0.98898446
91           -0.4689992         -0.1335866          0.1067399         -0.5347134       -0.3390322      -0.10305942
121          -0.2883347         -0.0863279         -0.1345800         -0.4017215       -0.3524496      -0.05570225
151          -0.6854744         -0.4619070         -0.3817771         -0.7260402       -0.4926117      -0.31947461
    fBodyGyro-mean-Z fBodyGyro-std-X fBodyGyro-std-Y fBodyGyro-std-Z fBodyAccMag-mean fBodyAccMag-std
1        -0.90930272      -0.8822965     -0.95123205      -0.9165825      -0.86176765      -0.7983009
31       -0.95131554      -0.9779042     -0.96234504      -0.9439178      -0.94778292      -0.9284448
61       -0.98077312      -0.9874971     -0.98710773      -0.9823453      -0.98535636      -0.9823138
91       -0.25594094      -0.5166919     -0.03350816      -0.4365622      -0.12862345      -0.3980326
121      -0.03186943      -0.4954225     -0.18141473      -0.2384436       0.09658453      -0.1865303
151      -0.45359721      -0.5658925      0.15153891      -0.5717078      -0.35239594      -0.4162601
    fBodyBodyAccJerkMag-mean fBodyBodyAccJerkMag-std fBodyBodyGyroMag-mean fBodyBodyGyroMag-std fBodyBodyGyroJerkMag-mean
1                -0.93330036              -0.9218040            -0.8621902           -0.8243194                -0.9423669
31               -0.98526213              -0.9816062            -0.9584356           -0.9321984                -0.9897975
61               -0.99254248              -0.9925360            -0.9846176           -0.9784661                -0.9948154
91               -0.05711940              -0.1034924            -0.1992526           -0.3210180                -0.3193086
121               0.02621849              -0.1040523            -0.1857203           -0.3983504                -0.2819634
151              -0.44265216              -0.5330599            -0.3259615           -0.1829855                -0.6346651
    fBodyBodyGyroJerkMag-std
1                 -0.9326607
31                -0.9870496
61                -0.9946711
91                -0.3816019
121               -0.3919199
151               -0.6939305
> 