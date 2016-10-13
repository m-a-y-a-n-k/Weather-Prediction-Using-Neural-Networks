#include<string>
#include<fstream>
#include<bits/stdc++.h>

using namespace std;

int main()
{
    fstream fin,fout;
    int i=1;
    char buffer [33];
    for(i=1;i<=7;i++)
    {
        itoa(i,buffer,10);
        string a(buffer);
        string s="Day"+a+".txt";
        fin.open(s.c_str(),ios::in);
        s="Weather"+s;
        fout.open(s.c_str(),ios::out);
        string line;
        getline(fin,line);
        while(!fin.eof())
        {
            getline(fin,line);
            int count=0;
            fout<<1;
            for(int i=0;i<line.size();i++)
            {
                if(line[i]==','){
                count++;
                fout<<" ";
                continue;
                }
                if(count>0&&count<6)
                {
                    fout<<line[i];
                }
                else if(count>=6)
                {
                    break;
                }
            }
            fout<<endl;
            getline(fin,line);
        }
        fin.close();
        fout.close();
    }
    return 0;
}
