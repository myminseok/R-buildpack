#include <iostream>
         #include <map>
         #include <vector>
         #include <utility>

         int main() {
            std::map< int, std::vector< int > > curmap;
            std::vector<int> v1(10);
            curmap.insert(std::pair< int, std::vector< int > >(100, v1));
            std::cout << curmap.size() << std::endl;
           return 0;
         }
// g++ -o testmap testmap.cpp -flto
