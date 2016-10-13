#include<string>
#include<fstream>
#include<bits/stdc++.h>

using namespace std;

string fun(string s)
{
    if(!s.compare("Fog"))
        return "0100";
    if(!s.compare("Rain"))
        return "0010";
    if(!s.compare("Thunderstorm"))
        return "0001";
    return "1000";
}

int main()
{
    fstream fin,fout;
    int i=1;
    bool arr[25]={false};
    arr[1]=true;
    arr[3]=true;
    arr[4]=true;
    arr[6]=true;
    arr[7]=true;
    arr[9]=true;
    arr[10]=true;
    arr[12]=true;
    arr[13]=true;
    arr[15]=true;
    arr[16]=true;
    arr[19]=true;
    arr[21]=true;

    char buffer[33];
    for(i=1;i<=6;i++)
    {
        itoa(i,buffer,10);
        string a(buffer);
        string s="200"+a+".txt";
        fin.open(s.c_str(),ios::in);
        s="Weather"+s;
        fout.open(s.c_str(),ios::out);
        string line;
        while(!fin.eof())
        {
            getline(fin,line);
            int count=0;
            fout<<"1 ";
            for(int i=0;i<line.size();i++)
            {
                string word="";
                while(i<line.size()&&line[i]!=',')
                {
                    word+=line[i];
                    i++;
                }
                if(!arr[count])
                {
                    count++;
                    continue;
                }
                if(count==21)
                {
                    std::size_t found = word.find("-");
                    if(word.size()==0)
                        fout<<"1000";
                    else if (found!=std::string::npos)
                    {
                        string newword="";
                        int j=word.size()-1;
                        while(j>-1&&word[j]!='-')
                        {
                            newword=word[j]+newword;
                            j--;
                        }
                        fout<<fun(newword);
                    }
                    else
                    {
                        fout<<fun(word);
                    }
                    fout<<" ";
                }
                else if(arr[count])
                {
                    fout<<word<<" ";
                }
                count++;
            }
            fout<<endl;
        }
        fin.close();
        fout.close();
    }
    return 0;
}
