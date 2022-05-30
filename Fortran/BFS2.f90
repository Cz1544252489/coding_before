module typedef
    implicit none
    type :: node
        integer :: distance, ID !������ָ��node%prev��node�ľ���
        logical :: is_last
        type(node), pointer :: prev
        type(node), pointer :: next
    end type node
end module typedef
  
!subroutine add_to_last(i, p, last)
!    implicit none
!    use typedef
!    type(node),pointer :: p, q, last
!    integer :: i
!    
!    allocate(q)
!    if(p%ID/=1) then
!        last%next=>q
!        q%prev=>last
!    else
!        q=node(0,1,.false.,null(),null())
!    end if 
!    return
!    end subroutine
    
!subroutine del_from_first()
!    implicit none
!    use typedef
!    type(node),pointer ::q
!
!    
!end subroutine

program main
    use typedef
    implicit none
    character(len=30) filename
    type(node), pointer :: p, q, head, last
    integer :: i, error, n
    integer :: adjmatrix(9,9)!,allocatable
    logical :: h
    
    filename='adjmatrix.txt'
    open(10,file=filename,status="old",iostat=error)
    if(error/=0) then
        write(*,*) "Open file fail!"
        stop
    end if 
    read(10,*) adjmatrix
    n=9
    !write(*,"(9I3.1)") adjmatrix
    allocate(head)
    head=node(0,1,.false.,null(),null())     !�ӵ�һ��Ԫ�ؿ�ʼ��������׻�ı�
    last=>head
    p=>head
    !�ȼ�����Ԫ�ص��ھ�

    do i=1,n            !��������Ԫ��
       if(adjmatrix(p%ID,i)/=0) then!������ھ�
            !if(last%prev/=null()) then
                p=node(adjmatrix(head%ID,i),i,.true.,null(),null())
                q=>last
                deallocate(last)
                q%next=>p               !�����Ԫ�ؼ����β
                p%prev=>q
                last=>q
        end if
    end do
    !write(*,*)adjmatrix(head%ID,2)
    p=>head
    do i=1,10
        write(*,*) p%ID
        p=>p%next
    end do
    
    
    !do while(.true.)
    !    if(associated(p) .and. associated(p)) then  !���׶�β����Ҫ��һ�������ӵ�
    !        if(p%is_last==.false.) then  !���p�������һ��
    !            write(*,*) head$ID      !����ִ�в���
    !            head%next%prev=>null()    !�ȵ�����һ��Ԫ��
    !            head=>head$next           !headָ��������һ��Ԫ��
    !            do i=1,nodenum            !��������Ԫ��
    !              if(adjmatrix(p%ID,i)==1) then!������ھ�
    !                q=node(adjmatrix(last%ID,i),i,.flase.,last,null())!�����Ԫ�ؼ����β
    !                last%next=>q
    !                last=>q
    !              end if
    !            end do
    !        else            
    !          write(*,*) "�������!"
    !          exit
    !        end if
    !    end if
    !end do
    stop
end program