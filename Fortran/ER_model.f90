program main
    implicit none
    real,parameter :: p=0.1
    integer,parameter :: n=1000
    integer,parameter :: kaver=4
    integer  :: edge(n,n),degree(n)
    real  :: cluster(n)
    integer  :: neighbor(n),length(n,n),temp(n,n)
    integer ::i,j,k,visit0,start,level      !level��ʾ�㼶
    real :: rand,averlen
    integer :: count,count0,count1,count2,flag
    integer,pointer :: Q=>null()   !����
    integer,target :: visit(n)   !�Ѿ�ɨ����ĵ�
    
    open(7,file="degree.txt")
    open(8,file="cluster.txt")
    open(9,file="length.txt")
    open(10,file="choose.txt")
    open(11,file="Scluster.txt")
    open(12,file="Minlength.txt")
    open(666,file="temp.txt")

    !��������
    do i=1,n
        degree(i)=0
        do j=1,n
            edge(i,j)=0
            edge(i,j)=0
       enddo
    enddo
    call random_seed()
    do i=1,n-1
        do j=i+1,n
            call random_number(rand)
            if(rand<p) then
                edge(j,i)=1
                edge(i,j)=1
                degree(i)=degree(i)+1
                degree(j)=degree(j)+1
            endif
        enddo
    enddo
    
    !�����
    !do i=1,n
    !    count=0
    !    do j=1,n
    !        if(degree(j)==i)then
    !            count=count+1
    !        endif
    !    enddo
    !    if(count/=0)then
    !        write(7,*) i,count
    !    endif
    !enddo
    
    !����ۼ�ϵ��
    !do i=1,n
    !    cluster(i)=0
    !    neighbor(i)=0
    !enddo
    !do i=1,n
    !    count=1
    !    do j=1,n
    !        if(edge(i,j)==1)then
    !            neighbor(count)=j
    !            count=count+1
    !        endif
    !    enddo
    !    do j=1,count-1
    !        do k=j+1,count-1
    !            if(edge(neighbor(j),neighbor(k))==1)then
    !                cluster(i)=cluster(i)+1
    !            endif
    !        enddo
    !    enddo
    !        cluster(i)=2*cluster(i)/degree(i)/(degree(i)-1)
    !    write(8,*) cluster(i)
    !enddo
    !write(11,*) p,sum(cluster)/n
    
    !�������·��
    do i=1,n-1
        do j=i+1,n
            if(edge(i,j)==1) then
                length(i,j)=1   !�������ߣ����������Ϊ1
                length(j,i)=1
            else
                length(i,j)=n   !��������Ϊ0
                length(j,i)=n
            end if
        end do
    end do
    do k=1,n
        do i=1,n
            if(length(i,k)<n .and. i/=k) then       !��i��k�ľ���С��n����¾���
                do j=1,n
                    if(length(k,j)<n .and. k/=j .and. j/=i)then
                        if(length(i,k)+length(k,j)<length(i,j))then     !�и��̵�·��ʱ����
                            length(i,j)=length(i,k)+length(k,j)
                        endif
                    endif
                enddo
            endif
        enddo
    enddo
    !do i=1,n
    !    do j=1,n
    !        if(length(j,i)==kaver)then
    !            temp(j,i)=1
    !        endif
    !    enddo
    !enddo
    !write(12,*) n,kaver,sum(temp)
    
    !����BFS�㷨�����·��
    !do start=1,n        !��ʼ��
    !    do i=1,n
    !        visit(n)=0
    !    enddo
    !    level=1                     !�������õ㵽��ʼ�����̾���                   
    !    visit(1)=start
    !    visit0=2
    !    Q=>visit(1)                 !ָ��ָ����ʼ��
    !        count=1
    !        do i=1,n           
    !            flag=0                  !������4�б�֤����ѡ���ظ��ĵ� 
    !            do j=1,visit0       
    !                if(i==visit(j)) flag=1
    !            enddo
    !            if(edge(i,Q)==1 .and. flag==0)then
    !                visit(visit0)=i     !visit�ļ�����Ϊvisit0
    !                length(i,start)=level
    !                length(start,i)=level
    !                count=count+1       
    !                visit0=visit0+1
    !            endif
    !        enddo                       !����count��ֵ���Ǵ˲�ĳ���
    !    do while(.true.)     !��visit��Ԫ�س���nʱ����ѭ��
    !        level=level+1
    !       do count1=visit0-count+1,visit0                    !ĳһ������
    !            Q=>visit(count1)
    !            do i=1,n
    !                flag=0                  !������4�б�֤����ѡ���ظ��ĵ� 
    !                do j=1,visit0       
    !                    if(i==visit(j)) flag=1
    !                enddo
    !                if(edge(i,Q)==1 .and. flag==0)then
    !                    visit(visit0)=i     !visit�ļ�����Ϊvisit0
    !                    length(i,start)=level
    !                    length(start,i)=level
    !                    count=count+1       
    !                    visit0=visit0+1
    !                endif
    !        if(visit0>n)exit
    !            enddo
    !        if(visit0>n)exit
    !       enddo
    !        if(visit0>n)exit
    !    enddo
    !enddo
    averlen=1.0*sum(length)/n/(n-1)
    write(666,*) p,n,averlen
    do j=1,n
        do i=1,n
            write(9,*)length(i,j)
        enddo
    enddo
    
end program  