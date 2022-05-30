program main
    implicit none
    integer,parameter :: n=1000
    real :: p=0.01
    integer,parameter :: k0=6 
    integer :: i,j,k,Newrand,visit0,start,level  !level��ʾ�㼶���������ڵ����̾���
    integer :: mark(n),degree(n),edge(n,n),neighbor(n),length(n,n),temp(n,n)
    integer :: kaver=4
    real :: cluster(n)
    real :: rand,averlen
    integer ::count,count0,count1,count2,flag
    
    integer,pointer :: Q=>null()   !����
    integer,target :: visit(n)   !�Ѿ�ɨ����ĵ�
    
    open(7,file="degree.txt")
    open(8,file="cluster.txt")
    open(9,file="length.txt")
    open(10,file="edge.xls")
    open(666,file="temp.txt")
        
    !����WSģ��
    do i=1,n
        do j=1,k0/2
            if(i+j<=n)then
                edge(i,i+j)=1
                edge(i+j,i)=1
                degree(i)=degree(i)+1
                degree(i+j)=degree(i+j)+1
            else
                edge(i,i+j-n)=1
                edge(i+j-n,i)=1
                degree(i)=degree(i)+1
                degree(i+j-n)=degree(i+j-n)+1
            endif
        enddo
    enddo
    call random_seed()
    do j=1,k0/2
        do i=1,n
            mark(i)=0                                                                                   
        enddo
        do i=1,n
            call random_number(rand)
            if(rand<p) mark(i)=1        !ѡ����Ҫ�����ı�
        enddo
        do i=1,n
            if(mark(i)==1)then
100             call random_number(rand)
                Newrand=int(n*rand)+1       !����ѡ�߲�����
                if(Newrand==i .or. edge(i,Newrand)==1) goto 100
                if(i+j<=n)then
                    edge(i,i+j)=0
                    edge(i+j,i)=0
                    degree(i+j)=degree(i+j)-1
                else
                    edge(i,i+j-n)=0
                    edge(i+j-n,i)=0
                    degree(i+j-n)=degree(i+j-n)-1
                endif
                edge(i,Newrand)=1
                edge(Newrand,i)=1
                degree(Newrand)=degree(Newrand)+1
            endif
        enddo
    enddo
    
    write(10,"(1000I)") edge
    !����ȷֲ�
    !do i=1,n
    !    count=0
    !    do j=1,n
    !        if(degree(j)==i)then
    !            count=count+1
    !        endif
    !    enddo
    !    if(count/=0)then
    !        write(7,*) i,1.0*count/n
    !    endif
    !enddo
    
    !����ۼ�ϵ��
    do i=1,n
        cluster(i)=0
        neighbor(i)=0
    enddo
    do i=1,n
        count=1
        do j=1,n
            if(edge(i,j)==1)then
                neighbor(count)=j
                count=count+1
            endif
        enddo
        do j=1,count-1
            do k=j+1,count-1
                if(edge(neighbor(j),neighbor(k))==1)then
                    cluster(i)=cluster(i)+1
                endif
            enddo
        enddo
            cluster(i)=2*cluster(i)/degree(i)/(degree(i)-1)
    enddo
    write(8,*) p,sum(cluster)/n
    
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
    !��������
    !do i=1,n-1
    !    do j=i+1,n
    !        if(edge(i,j)==1) then
    !            length(i,j)=1   !�������ߣ����������Ϊ1
    !            length(j,i)=1
    !        else
    !            length(i,j)=n   !��������Ϊ0
    !            length(j,i)=n
    !        end if
    !    end do
    !end do
    !do k=1,n
    !    do i=1,n
    !        if(length(i,k)<n .and. i/=k) then       !��i��k�ľ���С��n����¾���
    !            do j=1,n
    !                if(length(k,j)<n .and. k/=j .and. j/=i)then
    !                    if(length(i,k)+length(k,j)<length(i,j))then     !�и��̵�·��ʱ����
    !                        length(i,j)=length(i,k)+length(k,j)
    !                    endif
    !                endif
    !            enddo
    !        endif
    !    enddo
    !enddo

    !do i=1,n
    !    do j=1,n
    !        if(length(j,i)==kaver)then
    !            temp(j,i)=1
    !        endif
    !    enddo
    !enddo
    !do i=1,n
    !    do j=1,n
    !        write(9,*) length(j,i)
    !    enddo
    !enddo
    !averlen=1.0*sum(length)/n/(n-1)
    !write(666,*) p,n,averlen
end program                 