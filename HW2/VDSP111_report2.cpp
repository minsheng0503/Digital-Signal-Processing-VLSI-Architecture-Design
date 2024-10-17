#include<iostream>
#include<iomanip>
using namespace std;

float max_for_1(float a, float b, float c, float d, float e, float f, float g, float h, float i, float j);

int main(){

    float bound_1, bound_2;

    cout << "110521168_VDSP_HW2" << endl << endl;
    cout << "1. " << endl << endl << setw(5) << " L1 = ";

    float L1[2][2] = {8,8,4,4};

    for(int i=0; i<2; i++){
        for(int j=0; j<2; j++){
            cout << L1[i][j] << " ";
        }
        cout << endl << setw(7);
    }

    float L2[2][2];
    float temp[2] = {0,0};
    for(int i=0; i<2; i++){
        for(int j=0; j<2; j++){
            for(int k=0; k<2; k++){
                temp[k] = L1[i][k] + L1[k][j] ;
            }// now temp[0] = 16, temp[1] = 12
            L2[i][j] = max_for_1(-1,-1,-1,-1,-1,-1,-1,-1, temp[0], temp[1]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L2 = ";

    for(int i=0; i<2; i++){
        for(int j=0; j<2; j++){
            cout << L2[i][j] << " ";
        }
        cout << endl << setw(8);
    }

    bound_1 = max_for_1(-1,-1,-1,-1,-1,-1,L1[0][0]/1, L1[1][1]/1, L2[0][0], L2[1][1]);
    cout << endl << setw(0) << "iteration bound = " << bound_1 << endl << endl;
    
    //  Question 1 finished

    cout << "2. " << endl << endl << setw(5) << " L1 = ";

    float LL1[8][8] = {
        {-1,0,-1,-1,-1,-1,-1,-1},
        {-1,-1,0,-1,-1,-1,-1,-1},
        {-1,-1,-1,0,-1,-1,-1,-1},
        {6,-1,-1,-1,3,-1,-1,-1},
        {-1,-1,-1,-1,-1,0,-1,-1},
        {-1,-1,-1,-1,-1,-1,0,-1},
        {-1,-1,-1,-1,-1,-1,-1,0},
        {6,-1,-1,-1,3,-1,-1,-1}
    };

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL1[i][j]  << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL1 finished
    float LL2[8][8];
    float tmp[8] = {0,0,0,0,0,0,0,0};
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL1[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL1[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL2[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L2 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL2[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL2 finished
    float LL3[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL2[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL2[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL3[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L3 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL3[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL3 finished
    float LL4[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL3[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL3[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL4[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L4 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL4[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL4 finished
    float LL5[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL4[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL4[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL5[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L5 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL5[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL5 finished
    float LL6[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL5[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL5[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL6[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L6 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL6[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL6 finished
    float LL7[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL6[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL6[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL7[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L7 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL7[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL7 finished
    float LL8[8][8];
    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            for(int k=0; k<8; k++){
                if(LL1[i][k]!=-1 && LL7[k][j]!=-1)
                    tmp[k] = LL1[i][k] + LL7[k][j] ;
                else
                    tmp[k] = -1;
            }
            LL8[i][j] = max_for_1(-1,-1, tmp[0], tmp[1], tmp[2], tmp[3]
                                 , tmp[4], tmp[5], tmp[6], tmp[7]);
        }
    }

    cout << endl << setw(0)<< setw(6) << " L8 = ";

    for(int i=0; i<8; i++){
        for(int j=0; j<8; j++){
            cout << LL8[i][j] << " " << setw(2);
        }
        cout << endl << setw(8);
    }
    //  LL8 finished
    //  calculate iteration bound of Q2
    bound_2 = 0;
    for(int i=0; i<8; i++){
        if(LL1[i][i]/1 > bound_2)
            bound_2 = LL1[i][i]/1;
    }
    for(int i=0; i<8; i++){
        if(LL2[i][i]/2 > bound_2)
            bound_2 = LL2[i][i]/2;
    }
    for(int i=0; i<8; i++){
        if(LL3[i][i]/3 > bound_2)
            bound_2 = LL3[i][i]/3;
    }
    for(int i=0; i<8; i++){
        if(LL4[i][i]/4 > bound_2)
            bound_2 = LL4[i][i]/4;
    }
    for(int i=0; i<8; i++){
        if(LL5[i][i]/5 > bound_2)
            bound_2 = LL5[i][i]/5;
    }
    for(int i=0; i<8; i++){
        if(LL6[i][i]/6 > bound_2)
            bound_2 = LL6[i][i]/6;
    }
    for(int i=0; i<8; i++){
        if(LL7[i][i]/7 > bound_2)
            bound_2 = LL7[i][i]/7;
    }
    for(int i=0; i<8; i++){
        if(LL8[i][i]/8 > bound_2)
            bound_2 = LL8[i][i]/8;
    }
    cout << endl << setw(0) << "iteration bound = " << bound_2 << endl;
}

float max_for_1(float a, float b, float c, float d, float e, float f, float g, float h, float i, float j){
    a = -1;
    if(b>a)
        return b;
    else if(c>a)
        return c;
    else if(d>a)
        return d;
    else if(e>a)
        return e;
    else if(f>a)
        return f;
    else if(g>a)
        return g;
    else if(h>a)
        return h;
    else if(i>a)
        return i;
    else if(j>a)
        return j;    
    else
        return a;
}
