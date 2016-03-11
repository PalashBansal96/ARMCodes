#include <stdio.h>

int split (int a[], int low, int high)
{
    int x = a[high];
    int i = low - 1;
    int t1, t2;
    for (; low < high; low++)
    {
        t1=a[low];
        if (t1 <= x)
        {
            i++;
            t2=a[i];
            a[i]=t1;
            a[low]=t2;
        }
    }
    i++;
    t1=a[i];
    t2=a[low];
    a[i]=t2;
    a[low]=t1;
    return i;
}


void quicksort(int a[], int low, int high)
{
    int mid;
    
    if (low >= high)
        return;
    mid = split(a, low, high);
    quicksort(a, low, mid - 1);
    quicksort(a, mid + 1, high);
}

int main()
{   
    int n;
    scanf("%d", &n);
    int a[n],i;
    for (i = 0; i < n; i++)
        scanf("%d", &a[i]);
    
    quicksort(a, 0, n-1);
    
    for (i = 0; i < n; i++)
        printf("%d ", a[i]);

    return 0;
}