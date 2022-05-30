!
!������
!
module typedef
    implicit none
    type :: data
        integer :: n
        integer :: repeat
        type(data), pointer :: left
        type(data), pointer :: right
    endtype
end module typedef
    
module bin_tree
    use typedef
    implicit none
    private
    type(data), pointer :: tree, action
    integer, save :: numbers = 0
    public add, TraceTree
contains
!
!����������
!
    subroutine add(n)
        implicit none
        integer, intent(in) :: n
        integer :: err
        type(data), pointer :: new
        integer :: level
        level=1
        numbers=numbers+1
        write(*,'(1X,A5,I4,A8)')"Get :",numbers, " numbers:"
        !����һ���¿ռ�
        allocate(new, stat=err)
        if(err/=0) then
            write(*,*) "Out of memory!"
            stop
        end if
    
        write(*,"('root ')", advance="NO")
    
        !��������
        new%repeat=1
        new%n=n
        nullify(new%right, new%left)
    
        if(numbers==1) then
            action=> new
            tree=>new
            write(*,"(': new')")
            return
        end if 
    
        action=>tree
    
        do while(.true.)
            level=level+1
            if(n>action%n) then
                if(associated(action%right)) then
                    action=>action%right
                    write(*, "('->R: new')", advance="NO")
                else
                    action%right=>new
                    action=>new
                    write(*,"('->R: new')")
                    exit
                end if 
            elseif(n<action%n) then
                if(associated(action%left)) then
                    action=>action%left
                    write(*, "('->L')", advance="NO")
                else
                    action%left=>new
                    action=>new
                    write(*, "('->L: new')")
                    exit
                end if   
            elseif(n==action%n) then
                action%repeat=action%repeat+1
                deallocate(new)
                write(*, "(': Repeat')")
                return
            end if
        end do
    end subroutine

    
!
!��ʾ���������
!
    subroutine TraceTree()
        implicit none 
        call show_tree(tree)
        return
    end subroutine TraceTree
    !
    !�������ݵ��ӳ���
    !
    recursive subroutine show_tree(show)
        implicit none
        type(data), pointer :: show
    
        if(associated(show)) then 
            call show_tree(show%left)
            call show_data(show)
            call show_tree(show%right)
        end if
    
        return
    end subroutine show_tree
    !
    !��ʾ���֦�������������
    !
    subroutine show_data(show)
        implicit none
        type(data), pointer ::show
        integer :: i
    
        do i=1,show%repeat
            write(*,*) show%n
        end do
    
        return
    end subroutine show_data

end module bin_tree
!
!������
!
program main
    use bin_tree
    implicit none
    integer num
    
    do while(.true.)
        write(*,*) "����������������0�������"
        read(*,*) num 
        if(num==0) exit
        call add(num)
    end do
    call TraceTree()
    
    stop
end program main