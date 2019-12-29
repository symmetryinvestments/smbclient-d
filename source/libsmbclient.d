


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    alias size_t = c_ulong;
    int utime(const(char)*, const(utimbuf)*) @nogc nothrow;
    struct utimbuf
    {
        c_long actime;
        c_long modtime;
    }
    alias fsfilcnt_t = c_ulong;
    alias fsblkcnt_t = c_ulong;
    alias blkcnt_t = c_long;
    alias blksize_t = c_long;
    alias register_t = c_long;
    alias u_int64_t = c_ulong;
    alias u_int32_t = uint;
    alias u_int16_t = ushort;
    alias u_int8_t = ubyte;
    alias key_t = int;
    alias caddr_t = char*;
    alias daddr_t = int;
    alias ssize_t = c_long;
    alias id_t = uint;
    alias pid_t = int;
    alias off_t = c_long;
    alias uid_t = uint;
    alias nlink_t = c_ulong;
    alias mode_t = uint;
    alias gid_t = uint;
    alias dev_t = c_ulong;
    alias ino_t = c_ulong;
    alias loff_t = c_long;
    alias fsid_t = __fsid_t;
    alias u_quad_t = c_ulong;
    alias quad_t = c_long;
    alias u_long = c_ulong;
    alias u_int = uint;
    alias u_short = ushort;
    alias u_char = ubyte;
    int fstatvfs(int, statvfs*) @nogc nothrow;
    pragma(mangle, "statvfs") int statvfs_(const(char)*, statvfs*) @nogc nothrow;
    int __xmknodat(int, int, const(char)*, uint, c_ulong*) @nogc nothrow;
    int __xmknod(int, const(char)*, uint, c_ulong*) @nogc nothrow;
    int __fxstatat(int, int, const(char)*, stat*, int) @nogc nothrow;
    int __lxstat(int, const(char)*, stat*) @nogc nothrow;
    int __xstat(int, const(char)*, stat*) @nogc nothrow;
    int __fxstat(int, int, stat*) @nogc nothrow;
    int futimens(int, const(timespec)*) @nogc nothrow;
    int utimensat(int, const(char)*, const(timespec)*, int) @nogc nothrow;
    int mkfifoat(int, const(char)*, uint) @nogc nothrow;
    int mkfifo(const(char)*, uint) @nogc nothrow;
    int mknodat(int, const(char)*, uint, c_ulong) @nogc nothrow;
    int mknod(const(char)*, uint, c_ulong) @nogc nothrow;
    int mkdirat(int, const(char)*, uint) @nogc nothrow;
    int mkdir(const(char)*, uint) @nogc nothrow;
    uint umask(uint) @nogc nothrow;
    int fchmodat(int, const(char)*, uint, int) @nogc nothrow;
    int fchmod(int, uint) @nogc nothrow;
    int lchmod(const(char)*, uint) @nogc nothrow;
    int chmod(const(char)*, uint) @nogc nothrow;
    int lstat(const(char)*, stat*) @nogc nothrow;
    int fstatat(int, const(char)*, stat*, int) @nogc nothrow;
    int fstat(int, stat*) @nogc nothrow;
    pragma(mangle, "stat") int stat_(const(char)*, stat*) @nogc nothrow;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    alias fd_mask = c_long;
    struct fd_set
    {
        c_long[16] __fds_bits;
    }
    alias __fd_mask = c_long;
    alias suseconds_t = c_long;
    alias uintmax_t = c_ulong;
    alias intmax_t = c_long;
    alias uintptr_t = c_ulong;
    alias intptr_t = c_long;
    alias uint_fast64_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast16_t = c_ulong;
    alias uint_fast8_t = ubyte;
    alias int_fast64_t = c_long;
    alias int_fast32_t = c_long;
    alias int_fast16_t = c_long;
    alias int_fast8_t = byte;
    alias uint_least64_t = c_ulong;
    alias uint_least32_t = uint;
    alias uint_least16_t = ushort;
    alias uint_least8_t = ubyte;
    alias int_least64_t = c_long;
    alias int_least32_t = int;
    alias int_least16_t = short;
    alias int_least8_t = byte;
    static ushort __bswap_16(ushort) @nogc nothrow;
    static uint __bswap_32(uint) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    void smbc_thread_impl(int function(const(char)*, void**, const(char)*), void function(void*, const(char)*), int function(void*, int, const(char)*), int function(const(char)*, void**, const(char)*), void function(void**, const(char)*), int function(void*, const(void)*, const(char)*), void* function(void*, const(char)*)) @nogc nothrow;
    void smbc_thread_posix() @nogc nothrow;
    void smbc_set_credentials_with_fallback(_SMBCCTX*, const(char)*, const(char)*, const(char)*) @nogc nothrow;
    void smbc_set_credentials(const(char)*, const(char)*, const(char)*, int, const(char)*) @nogc nothrow;
    const(char)* smbc_version() @nogc nothrow;
    int smbc_urlencode(char*, char*, int) @nogc nothrow;
    int smbc_urldecode(char*, char*, c_ulong) @nogc nothrow;
    int smbc_remove_unused_server(_SMBCCTX*, _SMBCSRV*) @nogc nothrow;
    int smbc_unlink_print_job(const(char)*, int) @nogc nothrow;
    int smbc_list_print_jobs(const(char)*, void function(print_job_info*)) @nogc nothrow;
    int smbc_open_print_job(const(char)*) @nogc nothrow;
    int smbc_print_file(const(char)*, const(char)*) @nogc nothrow;
    int smbc_flistxattr(int, char*, c_ulong) @nogc nothrow;
    int smbc_llistxattr(const(char)*, char*, c_ulong) @nogc nothrow;
    int smbc_listxattr(const(char)*, char*, c_ulong) @nogc nothrow;
    int smbc_fremovexattr(int, const(char)*) @nogc nothrow;
    int smbc_lremovexattr(const(char)*, const(char)*) @nogc nothrow;
    int smbc_removexattr(const(char)*, const(char)*) @nogc nothrow;
    int smbc_fgetxattr(int, const(char)*, const(void)*, c_ulong) @nogc nothrow;
    int smbc_lgetxattr(const(char)*, const(char)*, const(void)*, c_ulong) @nogc nothrow;
    int smbc_getxattr(const(char)*, const(char)*, const(void)*, c_ulong) @nogc nothrow;
    int smbc_fsetxattr(int, const(char)*, const(void)*, c_ulong, int) @nogc nothrow;
    int smbc_lsetxattr(const(char)*, const(char)*, const(void)*, c_ulong, int) @nogc nothrow;
    int smbc_setxattr(const(char)*, const(char)*, const(void)*, c_ulong, int) @nogc nothrow;
    int smbc_utimes(const(char)*, timeval*) @nogc nothrow;
    int smbc_chmod(const(char)*, uint) @nogc nothrow;
    int smbc_ftruncate(int, c_long) @nogc nothrow;
    int smbc_fstatvfs(int, statvfs*) @nogc nothrow;
    int smbc_statvfs(char*, statvfs*) @nogc nothrow;
    int smbc_fstat(int, stat*) @nogc nothrow;
    int smbc_stat(const(char)*, stat*) @nogc nothrow;
    int smbc_notify(int, int, uint, uint, int function(const(smbc_notify_callback_action)*, c_ulong, void*), void*) @nogc nothrow;
    int smbc_rmdir(const(char)*) @nogc nothrow;
    int smbc_mkdir(const(char)*, uint) @nogc nothrow;
    int smbc_lseekdir(int, c_long) @nogc nothrow;
    c_long smbc_telldir(int) @nogc nothrow;
    const(libsmb_file_info)* smbc_readdirplus(uint) @nogc nothrow;
    smbc_dirent* smbc_readdir(uint) @nogc nothrow;
    int smbc_getdents(uint, smbc_dirent*, int) @nogc nothrow;
    int smbc_closedir(int) @nogc nothrow;
    int smbc_opendir(const(char)*) @nogc nothrow;
    int smbc_rename(const(char)*, const(char)*) @nogc nothrow;
    int smbc_unlink(const(char)*) @nogc nothrow;
    int smbc_close(int) @nogc nothrow;
    c_long smbc_lseek(int, c_long, int) @nogc nothrow;
    c_long smbc_write(int, const(void)*, c_ulong) @nogc nothrow;
    c_long smbc_read(int, void*, c_ulong) @nogc nothrow;
    int smbc_creat(const(char)*, uint) @nogc nothrow;
    int smbc_open(const(char)*, int, uint) @nogc nothrow;
    _SMBCCTX* smbc_set_context(_SMBCCTX*) @nogc nothrow;
    struct flock
    {
        short l_type;
        short l_whence;
        c_long l_start;
        c_long l_len;
        int l_pid;
    }
    int smbc_init(void function(const(char)*, const(char)*, char*, int, char*, int, char*, int), int) @nogc nothrow;
    _SMBCCTX* smbc_init_context(_SMBCCTX*) @nogc nothrow;
    void* smbc_option_get(_SMBCCTX*, char*) @nogc nothrow;
    void smbc_option_set(_SMBCCTX*, char*, ...) @nogc nothrow;
    int smbc_free_context(_SMBCCTX*, int) @nogc nothrow;
    _SMBCCTX* smbc_new_context() @nogc nothrow;
    void smbc_setFunctionUnlinkPrintJob(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, int)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, int) smbc_getFunctionUnlinkPrintJob(_SMBCCTX*) @nogc nothrow;
    alias smbc_unlink_print_job_fn = int function(_SMBCCTX*, const(char)*, int);
    void smbc_setFunctionListPrintJobs(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, void function(print_job_info*))) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, void function(print_job_info*)) smbc_getFunctionListPrintJobs(_SMBCCTX*) @nogc nothrow;
    alias smbc_list_print_jobs_fn = int function(_SMBCCTX*, const(char)*, void function(print_job_info*));
    void smbc_setFunctionOpenPrintJob(_SMBCCTX*, _SMBCFILE* function(_SMBCCTX*, const(char)*)) @nogc nothrow;
    _SMBCFILE* function(_SMBCCTX*, const(char)*) smbc_getFunctionOpenPrintJob(_SMBCCTX*) @nogc nothrow;
    alias smbc_open_print_job_fn = _SMBCFILE* function(_SMBCCTX*, const(char)*);
    void smbc_setFunctionPrintFile(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*) smbc_getFunctionPrintFile(_SMBCCTX*) @nogc nothrow;
    alias smbc_print_file_fn = int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*);
    void smbc_setFunctionListxattr(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, char*, c_ulong)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, char*, c_ulong) smbc_getFunctionListxattr(_SMBCCTX*) @nogc nothrow;
    alias smbc_listxattr_fn = int function(_SMBCCTX*, const(char)*, char*, c_ulong);
    void smbc_setFunctionRemovexattr(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, const(char)*)) @nogc nothrow;
    struct __pthread_rwlock_arch_t
    {
        uint __readers;
        uint __writers;
        uint __wrphase_futex;
        uint __writers_futex;
        uint __pad3;
        uint __pad4;
        int __cur_writer;
        int __shared;
        byte __rwelision;
        ubyte[7] __pad1;
        c_ulong __pad2;
        uint __flags;
    }
    int function(_SMBCCTX*, const(char)*, const(char)*) smbc_getFunctionRemovexattr(_SMBCCTX*) @nogc nothrow;
    alias smbc_removexattr_fn = int function(_SMBCCTX*, const(char)*, const(char)*);
    void smbc_setFunctionGetxattr(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong)) @nogc nothrow;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }
    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }
    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong) smbc_getFunctionGetxattr(_SMBCCTX*) @nogc nothrow;
    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }
    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    alias smbc_getxattr_fn = int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong);
    void smbc_setFunctionSetxattr(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong, int)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong, int) smbc_getFunctionSetxattr(_SMBCCTX*) @nogc nothrow;
    alias smbc_setxattr_fn = int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong, int);
    void smbc_setFunctionUtimes(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, timeval*)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, timeval*) smbc_getFunctionUtimes(_SMBCCTX*) @nogc nothrow;
    alias smbc_utimes_fn = int function(_SMBCCTX*, const(char)*, timeval*);
    void smbc_setFunctionChmod(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, uint)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, uint) smbc_getFunctionChmod(_SMBCCTX*) @nogc nothrow;
    alias smbc_chmod_fn = int function(_SMBCCTX*, const(char)*, uint);
    struct stat
    {
        c_ulong st_dev;
        c_ulong st_ino;
        c_ulong st_nlink;
        uint st_mode;
        uint st_uid;
        uint st_gid;
        int __pad0;
        c_ulong st_rdev;
        c_long st_size;
        c_long st_blksize;
        c_long st_blocks;
        timespec st_atim;
        timespec st_mtim;
        timespec st_ctim;
        c_long[3] __glibc_reserved;
    }
    void smbc_setFunctionNotify(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, int, uint, uint, int function(const(smbc_notify_callback_action)*, c_ulong, void*), void*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, int, uint, uint, int function(const(smbc_notify_callback_action)*, c_ulong, void*), void*) smbc_getFunctionNotify(_SMBCCTX*) @nogc nothrow;
    alias smbc_notify_fn = int function(_SMBCCTX*, _SMBCFILE*, int, uint, uint, int function(const(smbc_notify_callback_action)*, c_ulong, void*), void*);
    alias smbc_notify_callback_fn = int function(const(smbc_notify_callback_action)*, c_ulong, void*);
    struct smbc_notify_callback_action
    {
        uint action;
        const(char)* filename;
    }
    void smbc_setFunctionFstatdir(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, stat*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, stat*) smbc_getFunctionFstatdir(_SMBCCTX*) @nogc nothrow;
    alias smbc_fstatdir_fn = int function(_SMBCCTX*, _SMBCFILE*, stat*);
    void smbc_setFunctionLseekdir(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, c_long)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, c_long) smbc_getFunctionLseekdir(_SMBCCTX*) @nogc nothrow;
    alias smbc_lseekdir_fn = int function(_SMBCCTX*, _SMBCFILE*, c_long);
    void smbc_setFunctionTelldir(_SMBCCTX*, c_long function(_SMBCCTX*, _SMBCFILE*)) @nogc nothrow;
    c_long function(_SMBCCTX*, _SMBCFILE*) smbc_getFunctionTelldir(_SMBCCTX*) @nogc nothrow;
    alias smbc_telldir_fn = c_long function(_SMBCCTX*, _SMBCFILE*);
    void smbc_setFunctionRmdir(_SMBCCTX*, int function(_SMBCCTX*, const(char)*)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*) smbc_getFunctionRmdir(_SMBCCTX*) @nogc nothrow;
    alias smbc_rmdir_fn = int function(_SMBCCTX*, const(char)*);
    void smbc_setFunctionMkdir(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, uint)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, uint) smbc_getFunctionMkdir(_SMBCCTX*) @nogc nothrow;
    alias smbc_mkdir_fn = int function(_SMBCCTX*, const(char)*, uint);
    void smbc_setFunctionGetdents(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, smbc_dirent*, int)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, smbc_dirent*, int) smbc_getFunctionGetdents(_SMBCCTX*) @nogc nothrow;
    alias smbc_getdents_fn = int function(_SMBCCTX*, _SMBCFILE*, smbc_dirent*, int);
    void smbc_setFunctionReaddirPlus(_SMBCCTX*, const(libsmb_file_info)* function(_SMBCCTX*, _SMBCFILE*)) @nogc nothrow;
    const(libsmb_file_info)* function(_SMBCCTX*, _SMBCFILE*) smbc_getFunctionReaddirPlus(_SMBCCTX*) @nogc nothrow;
    struct statvfs
    {
        c_ulong f_bsize;
        c_ulong f_frsize;
        c_ulong f_blocks;
        c_ulong f_bfree;
        c_ulong f_bavail;
        c_ulong f_files;
        c_ulong f_ffree;
        c_ulong f_favail;
        c_ulong f_fsid;
        c_ulong f_flag;
        c_ulong f_namemax;
        int[6] __f_spare;
    }
    enum _Anonymous_0
    {
        ST_RDONLY = 1,
        ST_NOSUID = 2,
    }
    enum ST_RDONLY = _Anonymous_0.ST_RDONLY;
    enum ST_NOSUID = _Anonymous_0.ST_NOSUID;
    alias smbc_readdirplus_fn = const(libsmb_file_info)* function(_SMBCCTX*, _SMBCFILE*);
    void smbc_setFunctionReaddir(_SMBCCTX*, smbc_dirent* function(_SMBCCTX*, _SMBCFILE*)) @nogc nothrow;
    smbc_dirent* function(_SMBCCTX*, _SMBCFILE*) smbc_getFunctionReaddir(_SMBCCTX*) @nogc nothrow;
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    alias smbc_readdir_fn = smbc_dirent* function(_SMBCCTX*, _SMBCFILE*);
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    void smbc_setFunctionClosedir(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*)) @nogc nothrow;
    alias __pthread_list_t = __pthread_internal_list;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    int function(_SMBCCTX*, _SMBCFILE*) smbc_getFunctionClosedir(_SMBCCTX*) @nogc nothrow;
    alias smbc_closedir_fn = int function(_SMBCCTX*, _SMBCFILE*);
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_internal_list __list;
    }
    void smbc_setFunctionOpendir(_SMBCCTX*, _SMBCFILE* function(_SMBCCTX*, const(char)*)) @nogc nothrow;
    struct __pthread_cond_s
    {
        static union _Anonymous_1
        {
            ulong __wseq;
            static struct _Anonymous_2
            {
                uint __low;
                uint __high;
            }
            _Anonymous_2 __wseq32;
        }
        _Anonymous_1 _anonymous_3;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_3.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_3.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_3.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_3.__wseq32 = val; }
        static union _Anonymous_4
        {
            ulong __g1_start;
            static struct _Anonymous_5
            {
                uint __low;
                uint __high;
            }
            _Anonymous_5 __g1_start32;
        }
        _Anonymous_4 _anonymous_6;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_6.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_6.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_6.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_6.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    _SMBCFILE* function(_SMBCCTX*, const(char)*) smbc_getFunctionOpendir(_SMBCCTX*) @nogc nothrow;
    alias smbc_opendir_fn = _SMBCFILE* function(_SMBCCTX*, const(char)*);
    void smbc_setFunctionClose(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*) smbc_getFunctionClose(_SMBCCTX*) @nogc nothrow;
    alias __u_char = ubyte;
    alias __u_short = ushort;
    alias __u_int = uint;
    alias __u_long = c_ulong;
    alias __int8_t = byte;
    alias __uint8_t = ubyte;
    alias __int16_t = short;
    alias __uint16_t = ushort;
    alias __int32_t = int;
    alias __uint32_t = uint;
    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int_least8_t = byte;
    alias __uint_least8_t = ubyte;
    alias __int_least16_t = short;
    alias __uint_least16_t = ushort;
    alias __int_least32_t = int;
    alias __uint_least32_t = uint;
    alias __int_least64_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;
    alias smbc_close_fn = int function(_SMBCCTX*, _SMBCFILE*);
    void smbc_setFunctionFtruncate(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, c_long)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, c_long) smbc_getFunctionFtruncate(_SMBCCTX*) @nogc nothrow;
    alias smbc_ftruncate_fn = int function(_SMBCCTX*, _SMBCFILE*, c_long);
    void smbc_setFunctionFstatVFS(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, statvfs*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, statvfs*) smbc_getFunctionFstatVFS(_SMBCCTX*) @nogc nothrow;
    alias smbc_fstatvfs_fn = int function(_SMBCCTX*, _SMBCFILE*, statvfs*);
    void smbc_setFunctionStatVFS(_SMBCCTX*, int function(_SMBCCTX*, char*, statvfs*)) @nogc nothrow;
    int function(_SMBCCTX*, char*, statvfs*) smbc_getFunctionStatVFS(_SMBCCTX*) @nogc nothrow;
    alias smbc_statvfs_fn = int function(_SMBCCTX*, char*, statvfs*);
    void smbc_setFunctionFstat(_SMBCCTX*, int function(_SMBCCTX*, _SMBCFILE*, stat*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCFILE*, stat*) smbc_getFunctionFstat(_SMBCCTX*) @nogc nothrow;
    alias smbc_fstat_fn = int function(_SMBCCTX*, _SMBCFILE*, stat*);
    void smbc_setFunctionStat(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, stat*)) @nogc nothrow;
    int function(_SMBCCTX*, const(char)*, stat*) smbc_getFunctionStat(_SMBCCTX*) @nogc nothrow;
    alias __dev_t = c_ulong;
    alias __uid_t = uint;
    alias __gid_t = uint;
    alias __ino_t = c_ulong;
    alias __ino64_t = c_ulong;
    alias __mode_t = uint;
    alias __nlink_t = c_ulong;
    alias __off_t = c_long;
    alias __off64_t = c_long;
    alias __pid_t = int;
    struct __fsid_t
    {
        int[2] __val;
    }
    alias __clock_t = c_long;
    alias __rlim_t = c_ulong;
    alias __rlim64_t = c_ulong;
    alias __id_t = uint;
    alias __time_t = c_long;
    alias __useconds_t = uint;
    alias __suseconds_t = c_long;
    alias __daddr_t = int;
    alias __key_t = int;
    alias __clockid_t = int;
    alias __timer_t = void*;
    alias __blksize_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blkcnt64_t = c_long;
    alias __fsblkcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsword_t = c_long;
    alias __ssize_t = c_long;
    alias __syscall_slong_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __loff_t = c_long;
    alias __caddr_t = char*;
    alias __intptr_t = c_long;
    alias __socklen_t = uint;
    alias __sig_atomic_t = int;
    alias smbc_stat_fn = int function(_SMBCCTX*, const(char)*, stat*);
    void smbc_setFunctionLseek(_SMBCCTX*, c_long function(_SMBCCTX*, _SMBCFILE*, c_long, int)) @nogc nothrow;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    c_long function(_SMBCCTX*, _SMBCFILE*, c_long, int) smbc_getFunctionLseek(_SMBCCTX*) @nogc nothrow;
    alias clock_t = c_long;
    alias smbc_lseek_fn = c_long function(_SMBCCTX*, _SMBCFILE*, c_long, int);
    alias clockid_t = int;
    void smbc_setFunctionRename(_SMBCCTX*, int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*)) @nogc nothrow;
    alias sigset_t = __sigset_t;
    int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*) smbc_getFunctionRename(_SMBCCTX*) @nogc nothrow;
    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    alias smbc_rename_fn = int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*);
    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    void smbc_setFunctionUnlink(_SMBCCTX*, int function(_SMBCCTX*, const(char)*)) @nogc nothrow;
    alias time_t = c_long;
    int function(_SMBCCTX*, const(char)*) smbc_getFunctionUnlink(_SMBCCTX*) @nogc nothrow;
    alias timer_t = void*;
    alias smbc_unlink_fn = int function(_SMBCCTX*, const(char)*);
    void smbc_setFunctionSplice(_SMBCCTX*, c_long function(_SMBCCTX*, _SMBCFILE*, _SMBCFILE*, c_long, int function(c_long, void*), void*)) @nogc nothrow;
    c_long function(_SMBCCTX*, _SMBCFILE*, _SMBCFILE*, c_long, int function(c_long, void*), void*) smbc_getFunctionSplice(_SMBCCTX*) @nogc nothrow;
    alias smbc_splice_fn = c_long function(_SMBCCTX*, _SMBCFILE*, _SMBCFILE*, c_long, int function(c_long, void*), void*);
    void smbc_setFunctionWrite(_SMBCCTX*, c_long function(_SMBCCTX*, _SMBCFILE*, const(void)*, c_ulong)) @nogc nothrow;
    c_long function(_SMBCCTX*, _SMBCFILE*, const(void)*, c_ulong) smbc_getFunctionWrite(_SMBCCTX*) @nogc nothrow;
    alias smbc_write_fn = c_long function(_SMBCCTX*, _SMBCFILE*, const(void)*, c_ulong);
    void smbc_setFunctionRead(_SMBCCTX*, c_long function(_SMBCCTX*, _SMBCFILE*, void*, c_ulong)) @nogc nothrow;
    c_long function(_SMBCCTX*, _SMBCFILE*, void*, c_ulong) smbc_getFunctionRead(_SMBCCTX*) @nogc nothrow;
    alias smbc_read_fn = c_long function(_SMBCCTX*, _SMBCFILE*, void*, c_ulong);
    void smbc_setFunctionCreat(_SMBCCTX*, _SMBCFILE* function(_SMBCCTX*, const(char)*, uint)) @nogc nothrow;
    _SMBCFILE* function(_SMBCCTX*, const(char)*, uint) smbc_getFunctionCreat(_SMBCCTX*) @nogc nothrow;
    alias smbc_creat_fn = _SMBCFILE* function(_SMBCCTX*, const(char)*, uint);
    void smbc_setFunctionOpen(_SMBCCTX*, _SMBCFILE* function(_SMBCCTX*, const(char)*, int, uint)) @nogc nothrow;
    _SMBCFILE* function(_SMBCCTX*, const(char)*, int, uint) smbc_getFunctionOpen(_SMBCCTX*) @nogc nothrow;
    alias smbc_open_fn = _SMBCFILE* function(_SMBCCTX*, const(char)*, int, uint);
    void smbc_setServerCacheData(_SMBCCTX*, smbc_server_cache*) @nogc nothrow;
    smbc_server_cache* smbc_getServerCacheData(_SMBCCTX*) @nogc nothrow;
    struct smbc_server_cache;
    void smbc_setFunctionPurgeCachedServers(_SMBCCTX*, int function(_SMBCCTX*)) @nogc nothrow;
    int function(_SMBCCTX*) smbc_getFunctionPurgeCachedServers(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionRemoveCachedServer(_SMBCCTX*, int function(_SMBCCTX*, _SMBCSRV*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCSRV*) smbc_getFunctionRemoveCachedServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionGetCachedServer(_SMBCCTX*, _SMBCSRV* function(_SMBCCTX*, const(char)*, const(char)*, const(char)*, const(char)*)) @nogc nothrow;
    _SMBCSRV* function(_SMBCCTX*, const(char)*, const(char)*, const(char)*, const(char)*) smbc_getFunctionGetCachedServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionAddCachedServer(_SMBCCTX*, int function(_SMBCCTX*, _SMBCSRV*, const(char)*, const(char)*, const(char)*, const(char)*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCSRV*, const(char)*, const(char)*, const(char)*, const(char)*) smbc_getFunctionAddCachedServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionRemoveUnusedServer(_SMBCCTX*, int function(_SMBCCTX*, _SMBCSRV*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCSRV*) smbc_getFunctionRemoveUnusedServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionCheckServer(_SMBCCTX*, int function(_SMBCCTX*, _SMBCSRV*)) @nogc nothrow;
    int function(_SMBCCTX*, _SMBCSRV*) smbc_getFunctionCheckServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionAuthDataWithContext(_SMBCCTX*, void function(_SMBCCTX*, const(char)*, const(char)*, char*, int, char*, int, char*, int)) @nogc nothrow;
    void function(_SMBCCTX*, const(char)*, const(char)*, char*, int, char*, int, char*, int) smbc_getFunctionAuthDataWithContext(_SMBCCTX*) @nogc nothrow;
    void smbc_setFunctionAuthData(_SMBCCTX*, void function(const(char)*, const(char)*, char*, int, char*, int, char*, int)) @nogc nothrow;
    void function(const(char)*, const(char)*, char*, int, char*, int, char*, int) smbc_getFunctionAuthData(_SMBCCTX*) @nogc nothrow;
    int smbc_setOptionProtocols(_SMBCCTX*, const(char)*, const(char)*) @nogc nothrow;
    void smbc_setOptionUseNTHash(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionUseNTHash(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionUseCCache(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionUseCCache(_SMBCCTX*) @nogc nothrow;
    static ushort __uint16_identity(ushort) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
    void smbc_setOptionNoAutoAnonymousLogin(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionNoAutoAnonymousLogin(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionFallbackAfterKerberos(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionFallbackAfterKerberos(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionUseKerberos(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionUseKerberos(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionOneSharePerServer(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionOneSharePerServer(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionUrlEncodeReaddirEntries(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionUrlEncodeReaddirEntries(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionBrowseMaxLmbCount(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionBrowseMaxLmbCount(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionCaseSensitive(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionCaseSensitive(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionSmbEncryptionLevel(_SMBCCTX*, smbc_smb_encrypt_level) @nogc nothrow;
    smbc_smb_encrypt_level smbc_getOptionSmbEncryptionLevel(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionUserData(_SMBCCTX*, void*) @nogc nothrow;
    void* smbc_getOptionUserData(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionOpenShareMode(_SMBCCTX*, smbc_share_mode) @nogc nothrow;
    smbc_share_mode smbc_getOptionOpenShareMode(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionFullTimeNames(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionFullTimeNames(_SMBCCTX*) @nogc nothrow;
    void smbc_setOptionDebugToStderr(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getOptionDebugToStderr(_SMBCCTX*) @nogc nothrow;
    void smbc_setPort(_SMBCCTX*, ushort) @nogc nothrow;
    ushort smbc_getPort(_SMBCCTX*) @nogc nothrow;
    void smbc_setTimeout(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getTimeout(_SMBCCTX*) @nogc nothrow;
    void smbc_setUser(_SMBCCTX*, const(char)*) @nogc nothrow;
    const(char)* smbc_getUser(_SMBCCTX*) @nogc nothrow;
    void smbc_setWorkgroup(_SMBCCTX*, const(char)*) @nogc nothrow;
    const(char)* smbc_getWorkgroup(_SMBCCTX*) @nogc nothrow;
    void smbc_setNetbiosName(_SMBCCTX*, const(char)*) @nogc nothrow;
    const(char)* smbc_getNetbiosName(_SMBCCTX*) @nogc nothrow;
    int smbc_setConfiguration(_SMBCCTX*, const(char)*) @nogc nothrow;
    void smbc_setLogCallback(_SMBCCTX*, void*, void function(void*, int, const(char)*)) @nogc nothrow;
    void smbc_setDebug(_SMBCCTX*, int) @nogc nothrow;
    int smbc_getDebug(_SMBCCTX*) @nogc nothrow;
    alias smbc_purge_cached_fn = int function(_SMBCCTX*);
    alias smbc_remove_cached_srv_fn = int function(_SMBCCTX*, _SMBCSRV*);
    alias smbc_get_cached_srv_fn = _SMBCSRV* function(_SMBCCTX*, const(char)*, const(char)*, const(char)*, const(char)*);
    alias smbc_add_cached_srv_fn = int function(_SMBCCTX*, _SMBCSRV*, const(char)*, const(char)*, const(char)*, const(char)*);
    alias smbc_remove_unused_server_fn = int function(_SMBCCTX*, _SMBCSRV*);
    alias smbc_check_server_fn = int function(_SMBCCTX*, _SMBCSRV*);
    alias smbc_list_print_job_fn = void function(print_job_info*);
    alias smbc_get_auth_data_with_context_fn = void function(_SMBCCTX*, const(char)*, const(char)*, char*, int, char*, int, char*, int);
    alias smbc_get_auth_data_fn = void function(const(char)*, const(char)*, char*, int, char*, int, char*, int);
    struct _SMBCCTX
    {
        int debug_;
        char* netbios_name;
        char* workgroup;
        char* user;
        int timeout;
        _SMBCFILE* function(_SMBCCTX*, const(char)*, int, uint) open;
        _SMBCFILE* function(_SMBCCTX*, const(char)*, uint) creat;
        c_long function(_SMBCCTX*, _SMBCFILE*, void*, c_ulong) read;
        c_long function(_SMBCCTX*, _SMBCFILE*, const(void)*, c_ulong) write;
        int function(_SMBCCTX*, const(char)*) unlink;
        int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*) rename;
        c_long function(_SMBCCTX*, _SMBCFILE*, c_long, int) lseek;
        int function(_SMBCCTX*, const(char)*, stat*) stat_;
        int function(_SMBCCTX*, _SMBCFILE*, stat*) fstat;
        int function(_SMBCCTX*, _SMBCFILE*) close_fn;
        _SMBCFILE* function(_SMBCCTX*, const(char)*) opendir;
        int function(_SMBCCTX*, _SMBCFILE*) closedir;
        smbc_dirent* function(_SMBCCTX*, _SMBCFILE*) readdir;
        const(libsmb_file_info)* function(_SMBCCTX*, _SMBCFILE*) readdirplus;
        int function(_SMBCCTX*, _SMBCFILE*, smbc_dirent*, int) getdents;
        int function(_SMBCCTX*, const(char)*, uint) mkdir;
        int function(_SMBCCTX*, const(char)*) rmdir;
        c_long function(_SMBCCTX*, _SMBCFILE*) telldir;
        int function(_SMBCCTX*, _SMBCFILE*, c_long) lseekdir;
        int function(_SMBCCTX*, _SMBCFILE*, stat*) fstatdir;
        int function(_SMBCCTX*, const(char)*, uint) chmod;
        int function(_SMBCCTX*, const(char)*, timeval*) utimes;
        int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong, int) setxattr;
        int function(_SMBCCTX*, const(char)*, const(char)*, const(void)*, c_ulong) getxattr;
        int function(_SMBCCTX*, const(char)*, const(char)*) removexattr;
        int function(_SMBCCTX*, const(char)*, char*, c_ulong) listxattr;
        int function(_SMBCCTX*, const(char)*, _SMBCCTX*, const(char)*) print_file;
        _SMBCFILE* function(_SMBCCTX*, const(char)*) open_print_job;
        int function(_SMBCCTX*, const(char)*, void function(print_job_info*)) list_print_jobs;
        int function(_SMBCCTX*, const(char)*, int) unlink_print_job;
        struct _smbc_callbacks
        {
            void function(const(char)*, const(char)*, char*, int, char*, int, char*, int) auth_fn;
            int function(_SMBCCTX*, _SMBCSRV*) check_server_fn;
            int function(_SMBCCTX*, _SMBCSRV*) remove_unused_server_fn;
            int function(_SMBCCTX*, _SMBCSRV*, const(char)*, const(char)*, const(char)*, const(char)*) add_cached_srv_fn;
            _SMBCSRV* function(_SMBCCTX*, const(char)*, const(char)*, const(char)*, const(char)*) get_cached_srv_fn;
            int function(_SMBCCTX*, _SMBCSRV*) remove_cached_srv_fn;
            int function(_SMBCCTX*) purge_cached_fn;
        }
        _smbc_callbacks callbacks;
        void* reserved;
        int flags;
        struct _smbc_options
        {
            int browse_max_lmb_count;
            int urlencode_readdir_entries;
            int one_share_per_server;
        }
        _smbc_options options;
        SMBC_internal_data* internal;
    }
    alias SMBCCTX = _SMBCCTX;
    struct _SMBCFILE;
    alias SMBCFILE = _SMBCFILE;
    struct _SMBCSRV;
    alias SMBCSRV = _SMBCSRV;
    struct print_job_info
    {
        ushort id;
        ushort priority;
        c_ulong size;
        char[128] user;
        char[128] name;
        c_long t;
    }
    alias smbc_bool = int;
    enum smbc_vfs_feature
    {
        SMBC_VFS_FEATURE_RDONLY = 1,
        SMBC_VFS_FEATURE_DFS = 268435456,
        SMBC_VFS_FEATURE_CASE_INSENSITIVE = 536870912,
        SMBC_VFS_FEATURE_NO_UNIXCIFS = 1073741824,
    }
    enum SMBC_VFS_FEATURE_RDONLY = smbc_vfs_feature.SMBC_VFS_FEATURE_RDONLY;
    enum SMBC_VFS_FEATURE_DFS = smbc_vfs_feature.SMBC_VFS_FEATURE_DFS;
    enum SMBC_VFS_FEATURE_CASE_INSENSITIVE = smbc_vfs_feature.SMBC_VFS_FEATURE_CASE_INSENSITIVE;
    enum SMBC_VFS_FEATURE_NO_UNIXCIFS = smbc_vfs_feature.SMBC_VFS_FEATURE_NO_UNIXCIFS;
    enum smbc_smb_encrypt_level
    {
        SMBC_ENCRYPTLEVEL_NONE = 0,
        SMBC_ENCRYPTLEVEL_REQUEST = 1,
        SMBC_ENCRYPTLEVEL_REQUIRE = 2,
    }
    enum SMBC_ENCRYPTLEVEL_NONE = smbc_smb_encrypt_level.SMBC_ENCRYPTLEVEL_NONE;
    enum SMBC_ENCRYPTLEVEL_REQUEST = smbc_smb_encrypt_level.SMBC_ENCRYPTLEVEL_REQUEST;
    enum SMBC_ENCRYPTLEVEL_REQUIRE = smbc_smb_encrypt_level.SMBC_ENCRYPTLEVEL_REQUIRE;
    enum smbc_share_mode
    {
        SMBC_SHAREMODE_DENY_DOS = 0,
        SMBC_SHAREMODE_DENY_ALL = 1,
        SMBC_SHAREMODE_DENY_WRITE = 2,
        SMBC_SHAREMODE_DENY_READ = 3,
        SMBC_SHAREMODE_DENY_NONE = 4,
        SMBC_SHAREMODE_DENY_FCB = 7,
    }
    enum SMBC_SHAREMODE_DENY_DOS = smbc_share_mode.SMBC_SHAREMODE_DENY_DOS;
    enum SMBC_SHAREMODE_DENY_ALL = smbc_share_mode.SMBC_SHAREMODE_DENY_ALL;
    enum SMBC_SHAREMODE_DENY_WRITE = smbc_share_mode.SMBC_SHAREMODE_DENY_WRITE;
    enum SMBC_SHAREMODE_DENY_READ = smbc_share_mode.SMBC_SHAREMODE_DENY_READ;
    enum SMBC_SHAREMODE_DENY_NONE = smbc_share_mode.SMBC_SHAREMODE_DENY_NONE;
    enum SMBC_SHAREMODE_DENY_FCB = smbc_share_mode.SMBC_SHAREMODE_DENY_FCB;
    alias smbc_debug_callback_fn = void function(void*, int, const(char)*);
    struct libsmb_file_info
    {
        c_ulong size;
        ushort attrs;
        uint uid;
        uint gid;
        timespec btime_ts;
        timespec mtime_ts;
        timespec atime_ts;
        timespec ctime_ts;
        char* name;
        char* short_name;
    }
    struct smbc_dirent
    {
        uint smbc_type;
        uint dirlen;
        uint commentlen;
        char* comment;
        uint namelen;
        char[1] name;
    }
    int fcntl(int, int, ...) @nogc nothrow;
    int open(const(char)*, int, ...) @nogc nothrow;
    int openat(int, const(char)*, int, ...) @nogc nothrow;
    int creat(const(char)*, uint) @nogc nothrow;
    int lockf(int, int, c_long) @nogc nothrow;
    int posix_fadvise(int, c_long, c_long, int) @nogc nothrow;
    int posix_fallocate(int, c_long, c_long) @nogc nothrow;



    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(__USE_POSIX_IMPLICITLY))) {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); }))) {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }






    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }
    static if(!is(typeof(__GLIBC_USE_DEPRECATED_SCANF))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }






    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 30;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }






    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }




    static if(!is(typeof(F_TEST))) {
        private enum enumMixinStr_F_TEST = `enum F_TEST = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_F_TEST); }))) {
            mixin(enumMixinStr_F_TEST);
        }
    }




    static if(!is(typeof(F_TLOCK))) {
        private enum enumMixinStr_F_TLOCK = `enum F_TLOCK = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_F_TLOCK); }))) {
            mixin(enumMixinStr_F_TLOCK);
        }
    }




    static if(!is(typeof(F_LOCK))) {
        private enum enumMixinStr_F_LOCK = `enum F_LOCK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_F_LOCK); }))) {
            mixin(enumMixinStr_F_LOCK);
        }
    }




    static if(!is(typeof(F_ULOCK))) {
        private enum enumMixinStr_F_ULOCK = `enum F_ULOCK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_ULOCK); }))) {
            mixin(enumMixinStr_F_ULOCK);
        }
    }




    static if(!is(typeof(AT_EACCESS))) {
        private enum enumMixinStr_AT_EACCESS = `enum AT_EACCESS = 0x200;`;
        static if(is(typeof({ mixin(enumMixinStr_AT_EACCESS); }))) {
            mixin(enumMixinStr_AT_EACCESS);
        }
    }
    static if(!is(typeof(AT_SYMLINK_FOLLOW))) {
        private enum enumMixinStr_AT_SYMLINK_FOLLOW = `enum AT_SYMLINK_FOLLOW = 0x400;`;
        static if(is(typeof({ mixin(enumMixinStr_AT_SYMLINK_FOLLOW); }))) {
            mixin(enumMixinStr_AT_SYMLINK_FOLLOW);
        }
    }




    static if(!is(typeof(AT_REMOVEDIR))) {
        private enum enumMixinStr_AT_REMOVEDIR = `enum AT_REMOVEDIR = 0x200;`;
        static if(is(typeof({ mixin(enumMixinStr_AT_REMOVEDIR); }))) {
            mixin(enumMixinStr_AT_REMOVEDIR);
        }
    }




    static if(!is(typeof(AT_SYMLINK_NOFOLLOW))) {
        private enum enumMixinStr_AT_SYMLINK_NOFOLLOW = `enum AT_SYMLINK_NOFOLLOW = 0x100;`;
        static if(is(typeof({ mixin(enumMixinStr_AT_SYMLINK_NOFOLLOW); }))) {
            mixin(enumMixinStr_AT_SYMLINK_NOFOLLOW);
        }
    }




    static if(!is(typeof(AT_FDCWD))) {
        private enum enumMixinStr_AT_FDCWD = `enum AT_FDCWD = - 100;`;
        static if(is(typeof({ mixin(enumMixinStr_AT_FDCWD); }))) {
            mixin(enumMixinStr_AT_FDCWD);
        }
    }




    static if(!is(typeof(SEEK_END))) {
        private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_END); }))) {
            mixin(enumMixinStr_SEEK_END);
        }
    }






    static if(!is(typeof(SEEK_CUR))) {
        private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_CUR); }))) {
            mixin(enumMixinStr_SEEK_CUR);
        }
    }




    static if(!is(typeof(DEPRECATED_SMBC_INTERFACE))) {
        private enum enumMixinStr_DEPRECATED_SMBC_INTERFACE = `enum DEPRECATED_SMBC_INTERFACE = __attribute__ ( ( deprecated ) );`;
        static if(is(typeof({ mixin(enumMixinStr_DEPRECATED_SMBC_INTERFACE); }))) {
            mixin(enumMixinStr_DEPRECATED_SMBC_INTERFACE);
        }
    }




    static if(!is(typeof(SEEK_SET))) {
        private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_SET); }))) {
            mixin(enumMixinStr_SEEK_SET);
        }
    }




    static if(!is(typeof(F_OK))) {
        private enum enumMixinStr_F_OK = `enum F_OK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_OK); }))) {
            mixin(enumMixinStr_F_OK);
        }
    }




    static if(!is(typeof(X_OK))) {
        private enum enumMixinStr_X_OK = `enum X_OK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_X_OK); }))) {
            mixin(enumMixinStr_X_OK);
        }
    }




    static if(!is(typeof(W_OK))) {
        private enum enumMixinStr_W_OK = `enum W_OK = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_W_OK); }))) {
            mixin(enumMixinStr_W_OK);
        }
    }




    static if(!is(typeof(R_OK))) {
        private enum enumMixinStr_R_OK = `enum R_OK = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_R_OK); }))) {
            mixin(enumMixinStr_R_OK);
        }
    }




    static if(!is(typeof(S_IRWXO))) {
        private enum enumMixinStr_S_IRWXO = `enum S_IRWXO = ( S_IRWXG >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IRWXO); }))) {
            mixin(enumMixinStr_S_IRWXO);
        }
    }




    static if(!is(typeof(SMBC_BASE_FD))) {
        private enum enumMixinStr_SMBC_BASE_FD = `enum SMBC_BASE_FD = 10000;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_BASE_FD); }))) {
            mixin(enumMixinStr_SMBC_BASE_FD);
        }
    }




    static if(!is(typeof(SMBC_WORKGROUP))) {
        private enum enumMixinStr_SMBC_WORKGROUP = `enum SMBC_WORKGROUP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_WORKGROUP); }))) {
            mixin(enumMixinStr_SMBC_WORKGROUP);
        }
    }




    static if(!is(typeof(SMBC_SERVER))) {
        private enum enumMixinStr_SMBC_SERVER = `enum SMBC_SERVER = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_SERVER); }))) {
            mixin(enumMixinStr_SMBC_SERVER);
        }
    }




    static if(!is(typeof(SMBC_FILE_SHARE))) {
        private enum enumMixinStr_SMBC_FILE_SHARE = `enum SMBC_FILE_SHARE = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_FILE_SHARE); }))) {
            mixin(enumMixinStr_SMBC_FILE_SHARE);
        }
    }




    static if(!is(typeof(SMBC_PRINTER_SHARE))) {
        private enum enumMixinStr_SMBC_PRINTER_SHARE = `enum SMBC_PRINTER_SHARE = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_PRINTER_SHARE); }))) {
            mixin(enumMixinStr_SMBC_PRINTER_SHARE);
        }
    }




    static if(!is(typeof(SMBC_COMMS_SHARE))) {
        private enum enumMixinStr_SMBC_COMMS_SHARE = `enum SMBC_COMMS_SHARE = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_COMMS_SHARE); }))) {
            mixin(enumMixinStr_SMBC_COMMS_SHARE);
        }
    }




    static if(!is(typeof(SMBC_IPC_SHARE))) {
        private enum enumMixinStr_SMBC_IPC_SHARE = `enum SMBC_IPC_SHARE = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_IPC_SHARE); }))) {
            mixin(enumMixinStr_SMBC_IPC_SHARE);
        }
    }




    static if(!is(typeof(SMBC_DIR))) {
        private enum enumMixinStr_SMBC_DIR = `enum SMBC_DIR = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DIR); }))) {
            mixin(enumMixinStr_SMBC_DIR);
        }
    }




    static if(!is(typeof(SMBC_FILE))) {
        private enum enumMixinStr_SMBC_FILE = `enum SMBC_FILE = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_FILE); }))) {
            mixin(enumMixinStr_SMBC_FILE);
        }
    }




    static if(!is(typeof(SMBC_LINK))) {
        private enum enumMixinStr_SMBC_LINK = `enum SMBC_LINK = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_LINK); }))) {
            mixin(enumMixinStr_SMBC_LINK);
        }
    }




    static if(!is(typeof(S_IXOTH))) {
        private enum enumMixinStr_S_IXOTH = `enum S_IXOTH = ( S_IXGRP >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IXOTH); }))) {
            mixin(enumMixinStr_S_IXOTH);
        }
    }




    static if(!is(typeof(S_IWOTH))) {
        private enum enumMixinStr_S_IWOTH = `enum S_IWOTH = ( S_IWGRP >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IWOTH); }))) {
            mixin(enumMixinStr_S_IWOTH);
        }
    }




    static if(!is(typeof(S_IROTH))) {
        private enum enumMixinStr_S_IROTH = `enum S_IROTH = ( S_IRGRP >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IROTH); }))) {
            mixin(enumMixinStr_S_IROTH);
        }
    }




    static if(!is(typeof(SMBC_XATTR_FLAG_CREATE))) {
        private enum enumMixinStr_SMBC_XATTR_FLAG_CREATE = `enum SMBC_XATTR_FLAG_CREATE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_XATTR_FLAG_CREATE); }))) {
            mixin(enumMixinStr_SMBC_XATTR_FLAG_CREATE);
        }
    }




    static if(!is(typeof(SMBC_XATTR_FLAG_REPLACE))) {
        private enum enumMixinStr_SMBC_XATTR_FLAG_REPLACE = `enum SMBC_XATTR_FLAG_REPLACE = 0x2;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_XATTR_FLAG_REPLACE); }))) {
            mixin(enumMixinStr_SMBC_XATTR_FLAG_REPLACE);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_READONLY))) {
        private enum enumMixinStr_SMBC_DOS_MODE_READONLY = `enum SMBC_DOS_MODE_READONLY = 0x01;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_READONLY); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_READONLY);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_HIDDEN))) {
        private enum enumMixinStr_SMBC_DOS_MODE_HIDDEN = `enum SMBC_DOS_MODE_HIDDEN = 0x02;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_HIDDEN); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_HIDDEN);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_SYSTEM))) {
        private enum enumMixinStr_SMBC_DOS_MODE_SYSTEM = `enum SMBC_DOS_MODE_SYSTEM = 0x04;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_SYSTEM); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_SYSTEM);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_VOLUME_ID))) {
        private enum enumMixinStr_SMBC_DOS_MODE_VOLUME_ID = `enum SMBC_DOS_MODE_VOLUME_ID = 0x08;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_VOLUME_ID); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_VOLUME_ID);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_DIRECTORY))) {
        private enum enumMixinStr_SMBC_DOS_MODE_DIRECTORY = `enum SMBC_DOS_MODE_DIRECTORY = 0x10;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_DIRECTORY); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_DIRECTORY);
        }
    }




    static if(!is(typeof(SMBC_DOS_MODE_ARCHIVE))) {
        private enum enumMixinStr_SMBC_DOS_MODE_ARCHIVE = `enum SMBC_DOS_MODE_ARCHIVE = 0x20;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_DOS_MODE_ARCHIVE); }))) {
            mixin(enumMixinStr_SMBC_DOS_MODE_ARCHIVE);
        }
    }




    static if(!is(typeof(S_IRWXG))) {
        private enum enumMixinStr_S_IRWXG = `enum S_IRWXG = ( S_IRWXU >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IRWXG); }))) {
            mixin(enumMixinStr_S_IRWXG);
        }
    }




    static if(!is(typeof(S_IXGRP))) {
        private enum enumMixinStr_S_IXGRP = `enum S_IXGRP = ( S_IXUSR >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IXGRP); }))) {
            mixin(enumMixinStr_S_IXGRP);
        }
    }




    static if(!is(typeof(S_IWGRP))) {
        private enum enumMixinStr_S_IWGRP = `enum S_IWGRP = ( S_IWUSR >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IWGRP); }))) {
            mixin(enumMixinStr_S_IWGRP);
        }
    }




    static if(!is(typeof(S_IRGRP))) {
        private enum enumMixinStr_S_IRGRP = `enum S_IRGRP = ( S_IRUSR >> 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IRGRP); }))) {
            mixin(enumMixinStr_S_IRGRP);
        }
    }




    static if(!is(typeof(S_IRWXU))) {
        private enum enumMixinStr_S_IRWXU = `enum S_IRWXU = ( __S_IREAD | __S_IWRITE | __S_IEXEC );`;
        static if(is(typeof({ mixin(enumMixinStr_S_IRWXU); }))) {
            mixin(enumMixinStr_S_IRWXU);
        }
    }




    static if(!is(typeof(S_IXUSR))) {
        private enum enumMixinStr_S_IXUSR = `enum S_IXUSR = __S_IEXEC;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IXUSR); }))) {
            mixin(enumMixinStr_S_IXUSR);
        }
    }




    static if(!is(typeof(S_IWUSR))) {
        private enum enumMixinStr_S_IWUSR = `enum S_IWUSR = __S_IWRITE;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IWUSR); }))) {
            mixin(enumMixinStr_S_IWUSR);
        }
    }




    static if(!is(typeof(ENOATTR))) {
        private enum enumMixinStr_ENOATTR = `enum ENOATTR = ENOENT;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOATTR); }))) {
            mixin(enumMixinStr_ENOATTR);
        }
    }




    static if(!is(typeof(S_IRUSR))) {
        private enum enumMixinStr_S_IRUSR = `enum S_IRUSR = __S_IREAD;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IRUSR); }))) {
            mixin(enumMixinStr_S_IRUSR);
        }
    }




    static if(!is(typeof(S_ISVTX))) {
        private enum enumMixinStr_S_ISVTX = `enum S_ISVTX = __S_ISVTX;`;
        static if(is(typeof({ mixin(enumMixinStr_S_ISVTX); }))) {
            mixin(enumMixinStr_S_ISVTX);
        }
    }




    static if(!is(typeof(S_ISGID))) {
        private enum enumMixinStr_S_ISGID = `enum S_ISGID = __S_ISGID;`;
        static if(is(typeof({ mixin(enumMixinStr_S_ISGID); }))) {
            mixin(enumMixinStr_S_ISGID);
        }
    }




    static if(!is(typeof(S_ISUID))) {
        private enum enumMixinStr_S_ISUID = `enum S_ISUID = __S_ISUID;`;
        static if(is(typeof({ mixin(enumMixinStr_S_ISUID); }))) {
            mixin(enumMixinStr_S_ISUID);
        }
    }




    static if(!is(typeof(S_IFSOCK))) {
        private enum enumMixinStr_S_IFSOCK = `enum S_IFSOCK = __S_IFSOCK;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFSOCK); }))) {
            mixin(enumMixinStr_S_IFSOCK);
        }
    }




    static if(!is(typeof(S_IFLNK))) {
        private enum enumMixinStr_S_IFLNK = `enum S_IFLNK = __S_IFLNK;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFLNK); }))) {
            mixin(enumMixinStr_S_IFLNK);
        }
    }




    static if(!is(typeof(S_IFIFO))) {
        private enum enumMixinStr_S_IFIFO = `enum S_IFIFO = __S_IFIFO;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFIFO); }))) {
            mixin(enumMixinStr_S_IFIFO);
        }
    }




    static if(!is(typeof(SMB_CTX_FLAG_USE_KERBEROS))) {
        private enum enumMixinStr_SMB_CTX_FLAG_USE_KERBEROS = `enum SMB_CTX_FLAG_USE_KERBEROS = ( 1 << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_SMB_CTX_FLAG_USE_KERBEROS); }))) {
            mixin(enumMixinStr_SMB_CTX_FLAG_USE_KERBEROS);
        }
    }




    static if(!is(typeof(SMB_CTX_FLAG_FALLBACK_AFTER_KERBEROS))) {
        private enum enumMixinStr_SMB_CTX_FLAG_FALLBACK_AFTER_KERBEROS = `enum SMB_CTX_FLAG_FALLBACK_AFTER_KERBEROS = ( 1 << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SMB_CTX_FLAG_FALLBACK_AFTER_KERBEROS); }))) {
            mixin(enumMixinStr_SMB_CTX_FLAG_FALLBACK_AFTER_KERBEROS);
        }
    }




    static if(!is(typeof(SMBCCTX_FLAG_NO_AUTO_ANONYMOUS_LOGON))) {
        private enum enumMixinStr_SMBCCTX_FLAG_NO_AUTO_ANONYMOUS_LOGON = `enum SMBCCTX_FLAG_NO_AUTO_ANONYMOUS_LOGON = ( 1 << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr_SMBCCTX_FLAG_NO_AUTO_ANONYMOUS_LOGON); }))) {
            mixin(enumMixinStr_SMBCCTX_FLAG_NO_AUTO_ANONYMOUS_LOGON);
        }
    }




    static if(!is(typeof(SMB_CTX_FLAG_USE_CCACHE))) {
        private enum enumMixinStr_SMB_CTX_FLAG_USE_CCACHE = `enum SMB_CTX_FLAG_USE_CCACHE = ( 1 << 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_SMB_CTX_FLAG_USE_CCACHE); }))) {
            mixin(enumMixinStr_SMB_CTX_FLAG_USE_CCACHE);
        }
    }




    static if(!is(typeof(S_IFREG))) {
        private enum enumMixinStr_S_IFREG = `enum S_IFREG = __S_IFREG;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFREG); }))) {
            mixin(enumMixinStr_S_IFREG);
        }
    }




    static if(!is(typeof(S_IFBLK))) {
        private enum enumMixinStr_S_IFBLK = `enum S_IFBLK = __S_IFBLK;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFBLK); }))) {
            mixin(enumMixinStr_S_IFBLK);
        }
    }




    static if(!is(typeof(S_IFCHR))) {
        private enum enumMixinStr_S_IFCHR = `enum S_IFCHR = __S_IFCHR;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFCHR); }))) {
            mixin(enumMixinStr_S_IFCHR);
        }
    }




    static if(!is(typeof(S_IFDIR))) {
        private enum enumMixinStr_S_IFDIR = `enum S_IFDIR = __S_IFDIR;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFDIR); }))) {
            mixin(enumMixinStr_S_IFDIR);
        }
    }




    static if(!is(typeof(S_IFMT))) {
        private enum enumMixinStr_S_IFMT = `enum S_IFMT = __S_IFMT;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IFMT); }))) {
            mixin(enumMixinStr_S_IFMT);
        }
    }






    static if(!is(typeof(_FCNTL_H))) {
        private enum enumMixinStr__FCNTL_H = `enum _FCNTL_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FCNTL_H); }))) {
            mixin(enumMixinStr__FCNTL_H);
        }
    }
    static if(!is(typeof(BYTE_ORDER))) {
        private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_BYTE_ORDER); }))) {
            mixin(enumMixinStr_BYTE_ORDER);
        }
    }




    static if(!is(typeof(PDP_ENDIAN))) {
        private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = __PDP_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); }))) {
            mixin(enumMixinStr_PDP_ENDIAN);
        }
    }




    static if(!is(typeof(BIG_ENDIAN))) {
        private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = __BIG_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); }))) {
            mixin(enumMixinStr_BIG_ENDIAN);
        }
    }




    static if(!is(typeof(LITTLE_ENDIAN))) {
        private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr_LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(__FLOAT_WORD_ORDER))) {
        private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); }))) {
            mixin(enumMixinStr___FLOAT_WORD_ORDER);
        }
    }




    static if(!is(typeof(__PDP_ENDIAN))) {
        private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
        static if(is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); }))) {
            mixin(enumMixinStr___PDP_ENDIAN);
        }
    }




    static if(!is(typeof(__BIG_ENDIAN))) {
        private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
        static if(is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); }))) {
            mixin(enumMixinStr___BIG_ENDIAN);
        }
    }




    static if(!is(typeof(__LITTLE_ENDIAN))) {
        private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr___LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(_ENDIAN_H))) {
        private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ENDIAN_H); }))) {
            mixin(enumMixinStr__ENDIAN_H);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(__WCHAR_MIN))) {
        private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - __WCHAR_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MIN); }))) {
            mixin(enumMixinStr___WCHAR_MIN);
        }
    }




    static if(!is(typeof(__WCHAR_MAX))) {
        private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MAX); }))) {
            mixin(enumMixinStr___WCHAR_MAX);
        }
    }




    static if(!is(typeof(_BITS_WCHAR_H))) {
        private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); }))) {
            mixin(enumMixinStr__BITS_WCHAR_H);
        }
    }




    static if(!is(typeof(_BITS_UINTN_IDENTITY_H))) {
        private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); }))) {
            mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = __SWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(__timer_t_defined))) {
        private enum enumMixinStr___timer_t_defined = `enum __timer_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timer_t_defined); }))) {
            mixin(enumMixinStr___timer_t_defined);
        }
    }




    static if(!is(typeof(__time_t_defined))) {
        private enum enumMixinStr___time_t_defined = `enum __time_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___time_t_defined); }))) {
            mixin(enumMixinStr___time_t_defined);
        }
    }




    static if(!is(typeof(__timeval_defined))) {
        private enum enumMixinStr___timeval_defined = `enum __timeval_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timeval_defined); }))) {
            mixin(enumMixinStr___timeval_defined);
        }
    }




    static if(!is(typeof(_STRUCT_TIMESPEC))) {
        private enum enumMixinStr__STRUCT_TIMESPEC = `enum _STRUCT_TIMESPEC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRUCT_TIMESPEC); }))) {
            mixin(enumMixinStr__STRUCT_TIMESPEC);
        }
    }




    static if(!is(typeof(__sigset_t_defined))) {
        private enum enumMixinStr___sigset_t_defined = `enum __sigset_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___sigset_t_defined); }))) {
            mixin(enumMixinStr___sigset_t_defined);
        }
    }




    static if(!is(typeof(__clockid_t_defined))) {
        private enum enumMixinStr___clockid_t_defined = `enum __clockid_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clockid_t_defined); }))) {
            mixin(enumMixinStr___clockid_t_defined);
        }
    }




    static if(!is(typeof(__clock_t_defined))) {
        private enum enumMixinStr___clock_t_defined = `enum __clock_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clock_t_defined); }))) {
            mixin(enumMixinStr___clock_t_defined);
        }
    }




    static if(!is(typeof(_SIGSET_NWORDS))) {
        private enum enumMixinStr__SIGSET_NWORDS = `enum _SIGSET_NWORDS = ( 1024 / ( 8 * ( unsigned long int ) .sizeof ) );`;
        static if(is(typeof({ mixin(enumMixinStr__SIGSET_NWORDS); }))) {
            mixin(enumMixinStr__SIGSET_NWORDS);
        }
    }






    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(__TIMESIZE))) {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMESIZE); }))) {
            mixin(enumMixinStr___TIMESIZE);
        }
    }




    static if(!is(typeof(__TIME64_T_TYPE))) {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); }))) {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TIME64_H))) {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); }))) {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_HAVE_PREV))) {
        private enum enumMixinStr___PTHREAD_MUTEX_HAVE_PREV = `enum __PTHREAD_MUTEX_HAVE_PREV = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
        }
    }




    static if(!is(typeof(__PTHREAD_SPINS))) {
        private enum enumMixinStr___PTHREAD_SPINS = `enum __PTHREAD_SPINS = 0 , 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_SPINS); }))) {
            mixin(enumMixinStr___PTHREAD_SPINS);
        }
    }




    static if(!is(typeof(__PTHREAD_SPINS_DATA))) {
        private enum enumMixinStr___PTHREAD_SPINS_DATA = `enum __PTHREAD_SPINS_DATA = short __spins ; short __elision;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_SPINS_DATA); }))) {
            mixin(enumMixinStr___PTHREAD_SPINS_DATA);
        }
    }




    static if(!is(typeof(_THREAD_SHARED_TYPES_H))) {
        private enum enumMixinStr__THREAD_SHARED_TYPES_H = `enum _THREAD_SHARED_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__THREAD_SHARED_TYPES_H); }))) {
            mixin(enumMixinStr__THREAD_SHARED_TYPES_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_UINTN_H))) {
        private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_UINTN_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_INTN_H))) {
        private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_INTN_H);
        }
    }




    static if(!is(typeof(ST_NOSUID))) {
        private enum enumMixinStr_ST_NOSUID = `enum ST_NOSUID = ST_NOSUID;`;
        static if(is(typeof({ mixin(enumMixinStr_ST_NOSUID); }))) {
            mixin(enumMixinStr_ST_NOSUID);
        }
    }




    static if(!is(typeof(ST_RDONLY))) {
        private enum enumMixinStr_ST_RDONLY = `enum ST_RDONLY = ST_RDONLY;`;
        static if(is(typeof({ mixin(enumMixinStr_ST_RDONLY); }))) {
            mixin(enumMixinStr_ST_RDONLY);
        }
    }




    static if(!is(typeof(UTIME_OMIT))) {
        private enum enumMixinStr_UTIME_OMIT = `enum UTIME_OMIT = ( ( 1l << 30 ) - 2l );`;
        static if(is(typeof({ mixin(enumMixinStr_UTIME_OMIT); }))) {
            mixin(enumMixinStr_UTIME_OMIT);
        }
    }




    static if(!is(typeof(UTIME_NOW))) {
        private enum enumMixinStr_UTIME_NOW = `enum UTIME_NOW = ( ( 1l << 30 ) - 1l );`;
        static if(is(typeof({ mixin(enumMixinStr_UTIME_NOW); }))) {
            mixin(enumMixinStr_UTIME_NOW);
        }
    }




    static if(!is(typeof(__S_IEXEC))) {
        private enum enumMixinStr___S_IEXEC = `enum __S_IEXEC = std.conv.octal!100;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IEXEC); }))) {
            mixin(enumMixinStr___S_IEXEC);
        }
    }




    static if(!is(typeof(__S_IWRITE))) {
        private enum enumMixinStr___S_IWRITE = `enum __S_IWRITE = std.conv.octal!200;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IWRITE); }))) {
            mixin(enumMixinStr___S_IWRITE);
        }
    }




    static if(!is(typeof(__S_IREAD))) {
        private enum enumMixinStr___S_IREAD = `enum __S_IREAD = std.conv.octal!400;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IREAD); }))) {
            mixin(enumMixinStr___S_IREAD);
        }
    }




    static if(!is(typeof(__S_ISVTX))) {
        private enum enumMixinStr___S_ISVTX = `enum __S_ISVTX = std.conv.octal!1000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_ISVTX); }))) {
            mixin(enumMixinStr___S_ISVTX);
        }
    }




    static if(!is(typeof(__S_ISGID))) {
        private enum enumMixinStr___S_ISGID = `enum __S_ISGID = std.conv.octal!2000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_ISGID); }))) {
            mixin(enumMixinStr___S_ISGID);
        }
    }




    static if(!is(typeof(__S_ISUID))) {
        private enum enumMixinStr___S_ISUID = `enum __S_ISUID = std.conv.octal!4000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_ISUID); }))) {
            mixin(enumMixinStr___S_ISUID);
        }
    }
    static if(!is(typeof(__S_IFSOCK))) {
        private enum enumMixinStr___S_IFSOCK = `enum __S_IFSOCK = std.conv.octal!140000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFSOCK); }))) {
            mixin(enumMixinStr___S_IFSOCK);
        }
    }




    static if(!is(typeof(__S_IFLNK))) {
        private enum enumMixinStr___S_IFLNK = `enum __S_IFLNK = std.conv.octal!120000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFLNK); }))) {
            mixin(enumMixinStr___S_IFLNK);
        }
    }




    static if(!is(typeof(__S_IFIFO))) {
        private enum enumMixinStr___S_IFIFO = `enum __S_IFIFO = std.conv.octal!10000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFIFO); }))) {
            mixin(enumMixinStr___S_IFIFO);
        }
    }




    static if(!is(typeof(__S_IFREG))) {
        private enum enumMixinStr___S_IFREG = `enum __S_IFREG = std.conv.octal!100000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFREG); }))) {
            mixin(enumMixinStr___S_IFREG);
        }
    }




    static if(!is(typeof(__S_IFBLK))) {
        private enum enumMixinStr___S_IFBLK = `enum __S_IFBLK = std.conv.octal!60000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFBLK); }))) {
            mixin(enumMixinStr___S_IFBLK);
        }
    }




    static if(!is(typeof(__S_IFCHR))) {
        private enum enumMixinStr___S_IFCHR = `enum __S_IFCHR = std.conv.octal!20000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFCHR); }))) {
            mixin(enumMixinStr___S_IFCHR);
        }
    }




    static if(!is(typeof(__S_IFDIR))) {
        private enum enumMixinStr___S_IFDIR = `enum __S_IFDIR = std.conv.octal!40000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFDIR); }))) {
            mixin(enumMixinStr___S_IFDIR);
        }
    }




    static if(!is(typeof(__S_IFMT))) {
        private enum enumMixinStr___S_IFMT = `enum __S_IFMT = std.conv.octal!170000;`;
        static if(is(typeof({ mixin(enumMixinStr___S_IFMT); }))) {
            mixin(enumMixinStr___S_IFMT);
        }
    }






    static if(!is(typeof(SMBC_NOTIFY_ACTION_ADDED))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_ADDED = `enum SMBC_NOTIFY_ACTION_ADDED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_ADDED); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_ADDED);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_REMOVED))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED = `enum SMBC_NOTIFY_ACTION_REMOVED = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_MODIFIED))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED = `enum SMBC_NOTIFY_ACTION_MODIFIED = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_OLD_NAME))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_OLD_NAME = `enum SMBC_NOTIFY_ACTION_OLD_NAME = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_OLD_NAME); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_OLD_NAME);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_NEW_NAME))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_NEW_NAME = `enum SMBC_NOTIFY_ACTION_NEW_NAME = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_NEW_NAME); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_NEW_NAME);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_ADDED_STREAM))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_ADDED_STREAM = `enum SMBC_NOTIFY_ACTION_ADDED_STREAM = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_ADDED_STREAM); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_ADDED_STREAM);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_REMOVED_STREAM))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED_STREAM = `enum SMBC_NOTIFY_ACTION_REMOVED_STREAM = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED_STREAM); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_REMOVED_STREAM);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_ACTION_MODIFIED_STREAM))) {
        private enum enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED_STREAM = `enum SMBC_NOTIFY_ACTION_MODIFIED_STREAM = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED_STREAM); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_ACTION_MODIFIED_STREAM);
        }
    }
    static if(!is(typeof(st_ctime))) {
        private enum enumMixinStr_st_ctime = `enum st_ctime = st_ctim . tv_sec;`;
        static if(is(typeof({ mixin(enumMixinStr_st_ctime); }))) {
            mixin(enumMixinStr_st_ctime);
        }
    }




    static if(!is(typeof(st_mtime))) {
        private enum enumMixinStr_st_mtime = `enum st_mtime = st_mtim . tv_sec;`;
        static if(is(typeof({ mixin(enumMixinStr_st_mtime); }))) {
            mixin(enumMixinStr_st_mtime);
        }
    }




    static if(!is(typeof(st_atime))) {
        private enum enumMixinStr_st_atime = `enum st_atime = st_atim . tv_sec;`;
        static if(is(typeof({ mixin(enumMixinStr_st_atime); }))) {
            mixin(enumMixinStr_st_atime);
        }
    }




    static if(!is(typeof(_STAT_VER))) {
        private enum enumMixinStr__STAT_VER = `enum _STAT_VER = _STAT_VER_LINUX;`;
        static if(is(typeof({ mixin(enumMixinStr__STAT_VER); }))) {
            mixin(enumMixinStr__STAT_VER);
        }
    }




    static if(!is(typeof(_MKNOD_VER_LINUX))) {
        private enum enumMixinStr__MKNOD_VER_LINUX = `enum _MKNOD_VER_LINUX = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__MKNOD_VER_LINUX); }))) {
            mixin(enumMixinStr__MKNOD_VER_LINUX);
        }
    }




    static if(!is(typeof(_STAT_VER_LINUX))) {
        private enum enumMixinStr__STAT_VER_LINUX = `enum _STAT_VER_LINUX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STAT_VER_LINUX); }))) {
            mixin(enumMixinStr__STAT_VER_LINUX);
        }
    }




    static if(!is(typeof(_STAT_VER_KERNEL))) {
        private enum enumMixinStr__STAT_VER_KERNEL = `enum _STAT_VER_KERNEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__STAT_VER_KERNEL); }))) {
            mixin(enumMixinStr__STAT_VER_KERNEL);
        }
    }




    static if(!is(typeof(_BITS_STAT_H))) {
        private enum enumMixinStr__BITS_STAT_H = `enum _BITS_STAT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STAT_H); }))) {
            mixin(enumMixinStr__BITS_STAT_H);
        }
    }
    static if(!is(typeof(__FD_ZERO_STOS))) {
        private enum enumMixinStr___FD_ZERO_STOS = `enum __FD_ZERO_STOS = "stosq";`;
        static if(is(typeof({ mixin(enumMixinStr___FD_ZERO_STOS); }))) {
            mixin(enumMixinStr___FD_ZERO_STOS);
        }
    }




    static if(!is(typeof(__have_pthread_attr_t))) {
        private enum enumMixinStr___have_pthread_attr_t = `enum __have_pthread_attr_t = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___have_pthread_attr_t); }))) {
            mixin(enumMixinStr___have_pthread_attr_t);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_COMMON_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_COMMON_H = `enum _BITS_PTHREADTYPES_COMMON_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
        }
    }




    static if(!is(typeof(__PTHREAD_RWLOCK_INT_FLAGS_SHARED))) {
        private enum enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED = `enum __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED); }))) {
            mixin(enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED);
        }
    }




    static if(!is(typeof(__PTHREAD_RWLOCK_ELISION_EXTRA))) {
        private enum enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA = `enum __PTHREAD_RWLOCK_ELISION_EXTRA = 0 , { 0 , 0 , 0 , 0 , 0 , 0 , 0 };`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA); }))) {
            mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
        }
    }
    static if(!is(typeof(__PTHREAD_MUTEX_USE_UNION))) {
        private enum enumMixinStr___PTHREAD_MUTEX_USE_UNION = `enum __PTHREAD_MUTEX_USE_UNION = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_USE_UNION); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_USE_UNION);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_NUSERS_AFTER_KIND))) {
        private enum enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND = `enum __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_LOCK_ELISION))) {
        private enum enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION = `enum __PTHREAD_MUTEX_LOCK_ELISION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION);
        }
    }
    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIERATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T = `enum __SIZEOF_PTHREAD_BARRIERATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCKATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T = `enum __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_CONDATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T = `enum __SIZEOF_PTHREAD_CONDATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_COND_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_COND_T = `enum __SIZEOF_PTHREAD_COND_T = 48;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEXATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T = `enum __SIZEOF_PTHREAD_MUTEXATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIER_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIER_T = `enum __SIZEOF_PTHREAD_BARRIER_T = 32;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCK_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T = `enum __SIZEOF_PTHREAD_RWLOCK_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEX_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEX_T = `enum __SIZEOF_PTHREAD_MUTEX_T = 40;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_ATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_ATTR_T = `enum __SIZEOF_PTHREAD_ATTR_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_ARCH_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_ARCH_H = `enum _BITS_PTHREADTYPES_ARCH_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(F_SETLKW64))) {
        private enum enumMixinStr_F_SETLKW64 = `enum F_SETLKW64 = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETLKW64); }))) {
            mixin(enumMixinStr_F_SETLKW64);
        }
    }




    static if(!is(typeof(F_SETLK64))) {
        private enum enumMixinStr_F_SETLK64 = `enum F_SETLK64 = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETLK64); }))) {
            mixin(enumMixinStr_F_SETLK64);
        }
    }




    static if(!is(typeof(F_GETLK64))) {
        private enum enumMixinStr_F_GETLK64 = `enum F_GETLK64 = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_F_GETLK64); }))) {
            mixin(enumMixinStr_F_GETLK64);
        }
    }




    static if(!is(typeof(__O_LARGEFILE))) {
        private enum enumMixinStr___O_LARGEFILE = `enum __O_LARGEFILE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___O_LARGEFILE); }))) {
            mixin(enumMixinStr___O_LARGEFILE);
        }
    }




    static if(!is(typeof(POSIX_FADV_NOREUSE))) {
        private enum enumMixinStr_POSIX_FADV_NOREUSE = `enum POSIX_FADV_NOREUSE = __POSIX_FADV_NOREUSE;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_NOREUSE); }))) {
            mixin(enumMixinStr_POSIX_FADV_NOREUSE);
        }
    }




    static if(!is(typeof(POSIX_FADV_DONTNEED))) {
        private enum enumMixinStr_POSIX_FADV_DONTNEED = `enum POSIX_FADV_DONTNEED = __POSIX_FADV_DONTNEED;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_DONTNEED); }))) {
            mixin(enumMixinStr_POSIX_FADV_DONTNEED);
        }
    }




    static if(!is(typeof(POSIX_FADV_WILLNEED))) {
        private enum enumMixinStr_POSIX_FADV_WILLNEED = `enum POSIX_FADV_WILLNEED = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_WILLNEED); }))) {
            mixin(enumMixinStr_POSIX_FADV_WILLNEED);
        }
    }




    static if(!is(typeof(POSIX_FADV_SEQUENTIAL))) {
        private enum enumMixinStr_POSIX_FADV_SEQUENTIAL = `enum POSIX_FADV_SEQUENTIAL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_SEQUENTIAL); }))) {
            mixin(enumMixinStr_POSIX_FADV_SEQUENTIAL);
        }
    }




    static if(!is(typeof(POSIX_FADV_RANDOM))) {
        private enum enumMixinStr_POSIX_FADV_RANDOM = `enum POSIX_FADV_RANDOM = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_RANDOM); }))) {
            mixin(enumMixinStr_POSIX_FADV_RANDOM);
        }
    }




    static if(!is(typeof(POSIX_FADV_NORMAL))) {
        private enum enumMixinStr_POSIX_FADV_NORMAL = `enum POSIX_FADV_NORMAL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_POSIX_FADV_NORMAL); }))) {
            mixin(enumMixinStr_POSIX_FADV_NORMAL);
        }
    }




    static if(!is(typeof(__POSIX_FADV_NOREUSE))) {
        private enum enumMixinStr___POSIX_FADV_NOREUSE = `enum __POSIX_FADV_NOREUSE = 5;`;
        static if(is(typeof({ mixin(enumMixinStr___POSIX_FADV_NOREUSE); }))) {
            mixin(enumMixinStr___POSIX_FADV_NOREUSE);
        }
    }




    static if(!is(typeof(__POSIX_FADV_DONTNEED))) {
        private enum enumMixinStr___POSIX_FADV_DONTNEED = `enum __POSIX_FADV_DONTNEED = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___POSIX_FADV_DONTNEED); }))) {
            mixin(enumMixinStr___POSIX_FADV_DONTNEED);
        }
    }




    static if(!is(typeof(FNDELAY))) {
        private enum enumMixinStr_FNDELAY = `enum FNDELAY = O_NDELAY;`;
        static if(is(typeof({ mixin(enumMixinStr_FNDELAY); }))) {
            mixin(enumMixinStr_FNDELAY);
        }
    }




    static if(!is(typeof(FNONBLOCK))) {
        private enum enumMixinStr_FNONBLOCK = `enum FNONBLOCK = O_NONBLOCK;`;
        static if(is(typeof({ mixin(enumMixinStr_FNONBLOCK); }))) {
            mixin(enumMixinStr_FNONBLOCK);
        }
    }




    static if(!is(typeof(FASYNC))) {
        private enum enumMixinStr_FASYNC = `enum FASYNC = O_ASYNC;`;
        static if(is(typeof({ mixin(enumMixinStr_FASYNC); }))) {
            mixin(enumMixinStr_FASYNC);
        }
    }




    static if(!is(typeof(FFSYNC))) {
        private enum enumMixinStr_FFSYNC = `enum FFSYNC = O_FSYNC;`;
        static if(is(typeof({ mixin(enumMixinStr_FFSYNC); }))) {
            mixin(enumMixinStr_FFSYNC);
        }
    }




    static if(!is(typeof(FAPPEND))) {
        private enum enumMixinStr_FAPPEND = `enum FAPPEND = O_APPEND;`;
        static if(is(typeof({ mixin(enumMixinStr_FAPPEND); }))) {
            mixin(enumMixinStr_FAPPEND);
        }
    }




    static if(!is(typeof(LOCK_UN))) {
        private enum enumMixinStr_LOCK_UN = `enum LOCK_UN = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_LOCK_UN); }))) {
            mixin(enumMixinStr_LOCK_UN);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_FILE_NAME))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_FILE_NAME = `enum SMBC_NOTIFY_CHANGE_FILE_NAME = 0x001;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_FILE_NAME); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_FILE_NAME);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_DIR_NAME))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_DIR_NAME = `enum SMBC_NOTIFY_CHANGE_DIR_NAME = 0x002;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_DIR_NAME); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_DIR_NAME);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_ATTRIBUTES))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_ATTRIBUTES = `enum SMBC_NOTIFY_CHANGE_ATTRIBUTES = 0x004;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_ATTRIBUTES); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_ATTRIBUTES);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_SIZE))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_SIZE = `enum SMBC_NOTIFY_CHANGE_SIZE = 0x008;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_SIZE); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_SIZE);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_LAST_WRITE))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_WRITE = `enum SMBC_NOTIFY_CHANGE_LAST_WRITE = 0x010;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_WRITE); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_WRITE);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_LAST_ACCESS))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_ACCESS = `enum SMBC_NOTIFY_CHANGE_LAST_ACCESS = 0x020;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_ACCESS); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_LAST_ACCESS);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_CREATION))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_CREATION = `enum SMBC_NOTIFY_CHANGE_CREATION = 0x040;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_CREATION); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_CREATION);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_EA))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_EA = `enum SMBC_NOTIFY_CHANGE_EA = 0x080;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_EA); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_EA);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_SECURITY))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_SECURITY = `enum SMBC_NOTIFY_CHANGE_SECURITY = 0x100;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_SECURITY); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_SECURITY);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_STREAM_NAME))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_NAME = `enum SMBC_NOTIFY_CHANGE_STREAM_NAME = 0x200;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_NAME); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_NAME);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_STREAM_SIZE))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_SIZE = `enum SMBC_NOTIFY_CHANGE_STREAM_SIZE = 0x400;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_SIZE); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_SIZE);
        }
    }




    static if(!is(typeof(SMBC_NOTIFY_CHANGE_STREAM_WRITE))) {
        private enum enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_WRITE = `enum SMBC_NOTIFY_CHANGE_STREAM_WRITE = 0x800;`;
        static if(is(typeof({ mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_WRITE); }))) {
            mixin(enumMixinStr_SMBC_NOTIFY_CHANGE_STREAM_WRITE);
        }
    }




    static if(!is(typeof(LOCK_NB))) {
        private enum enumMixinStr_LOCK_NB = `enum LOCK_NB = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_LOCK_NB); }))) {
            mixin(enumMixinStr_LOCK_NB);
        }
    }




    static if(!is(typeof(LOCK_EX))) {
        private enum enumMixinStr_LOCK_EX = `enum LOCK_EX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_LOCK_EX); }))) {
            mixin(enumMixinStr_LOCK_EX);
        }
    }




    static if(!is(typeof(LOCK_SH))) {
        private enum enumMixinStr_LOCK_SH = `enum LOCK_SH = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_LOCK_SH); }))) {
            mixin(enumMixinStr_LOCK_SH);
        }
    }




    static if(!is(typeof(F_SHLCK))) {
        private enum enumMixinStr_F_SHLCK = `enum F_SHLCK = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SHLCK); }))) {
            mixin(enumMixinStr_F_SHLCK);
        }
    }




    static if(!is(typeof(F_EXLCK))) {
        private enum enumMixinStr_F_EXLCK = `enum F_EXLCK = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_F_EXLCK); }))) {
            mixin(enumMixinStr_F_EXLCK);
        }
    }




    static if(!is(typeof(F_UNLCK))) {
        private enum enumMixinStr_F_UNLCK = `enum F_UNLCK = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_F_UNLCK); }))) {
            mixin(enumMixinStr_F_UNLCK);
        }
    }




    static if(!is(typeof(F_WRLCK))) {
        private enum enumMixinStr_F_WRLCK = `enum F_WRLCK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_F_WRLCK); }))) {
            mixin(enumMixinStr_F_WRLCK);
        }
    }




    static if(!is(typeof(F_RDLCK))) {
        private enum enumMixinStr_F_RDLCK = `enum F_RDLCK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_RDLCK); }))) {
            mixin(enumMixinStr_F_RDLCK);
        }
    }




    static if(!is(typeof(FD_CLOEXEC))) {
        private enum enumMixinStr_FD_CLOEXEC = `enum FD_CLOEXEC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_FD_CLOEXEC); }))) {
            mixin(enumMixinStr_FD_CLOEXEC);
        }
    }




    static if(!is(typeof(F_DUPFD_CLOEXEC))) {
        private enum enumMixinStr_F_DUPFD_CLOEXEC = `enum F_DUPFD_CLOEXEC = 1030;`;
        static if(is(typeof({ mixin(enumMixinStr_F_DUPFD_CLOEXEC); }))) {
            mixin(enumMixinStr_F_DUPFD_CLOEXEC);
        }
    }




    static if(!is(typeof(__F_GETOWN_EX))) {
        private enum enumMixinStr___F_GETOWN_EX = `enum __F_GETOWN_EX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr___F_GETOWN_EX); }))) {
            mixin(enumMixinStr___F_GETOWN_EX);
        }
    }




    static if(!is(typeof(__F_SETOWN_EX))) {
        private enum enumMixinStr___F_SETOWN_EX = `enum __F_SETOWN_EX = 15;`;
        static if(is(typeof({ mixin(enumMixinStr___F_SETOWN_EX); }))) {
            mixin(enumMixinStr___F_SETOWN_EX);
        }
    }




    static if(!is(typeof(__F_GETSIG))) {
        private enum enumMixinStr___F_GETSIG = `enum __F_GETSIG = 11;`;
        static if(is(typeof({ mixin(enumMixinStr___F_GETSIG); }))) {
            mixin(enumMixinStr___F_GETSIG);
        }
    }




    static if(!is(typeof(__F_SETSIG))) {
        private enum enumMixinStr___F_SETSIG = `enum __F_SETSIG = 10;`;
        static if(is(typeof({ mixin(enumMixinStr___F_SETSIG); }))) {
            mixin(enumMixinStr___F_SETSIG);
        }
    }




    static if(!is(typeof(F_GETOWN))) {
        private enum enumMixinStr_F_GETOWN = `enum F_GETOWN = __F_GETOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_F_GETOWN); }))) {
            mixin(enumMixinStr_F_GETOWN);
        }
    }




    static if(!is(typeof(F_SETOWN))) {
        private enum enumMixinStr_F_SETOWN = `enum F_SETOWN = __F_SETOWN;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETOWN); }))) {
            mixin(enumMixinStr_F_SETOWN);
        }
    }




    static if(!is(typeof(__F_GETOWN))) {
        private enum enumMixinStr___F_GETOWN = `enum __F_GETOWN = 9;`;
        static if(is(typeof({ mixin(enumMixinStr___F_GETOWN); }))) {
            mixin(enumMixinStr___F_GETOWN);
        }
    }




    static if(!is(typeof(__F_SETOWN))) {
        private enum enumMixinStr___F_SETOWN = `enum __F_SETOWN = 8;`;
        static if(is(typeof({ mixin(enumMixinStr___F_SETOWN); }))) {
            mixin(enumMixinStr___F_SETOWN);
        }
    }




    static if(!is(typeof(F_SETFL))) {
        private enum enumMixinStr_F_SETFL = `enum F_SETFL = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETFL); }))) {
            mixin(enumMixinStr_F_SETFL);
        }
    }




    static if(!is(typeof(F_GETFL))) {
        private enum enumMixinStr_F_GETFL = `enum F_GETFL = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_F_GETFL); }))) {
            mixin(enumMixinStr_F_GETFL);
        }
    }




    static if(!is(typeof(F_SETFD))) {
        private enum enumMixinStr_F_SETFD = `enum F_SETFD = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETFD); }))) {
            mixin(enumMixinStr_F_SETFD);
        }
    }




    static if(!is(typeof(F_GETFD))) {
        private enum enumMixinStr_F_GETFD = `enum F_GETFD = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_F_GETFD); }))) {
            mixin(enumMixinStr_F_GETFD);
        }
    }




    static if(!is(typeof(F_DUPFD))) {
        private enum enumMixinStr_F_DUPFD = `enum F_DUPFD = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_DUPFD); }))) {
            mixin(enumMixinStr_F_DUPFD);
        }
    }




    static if(!is(typeof(O_RSYNC))) {
        private enum enumMixinStr_O_RSYNC = `enum O_RSYNC = O_SYNC;`;
        static if(is(typeof({ mixin(enumMixinStr_O_RSYNC); }))) {
            mixin(enumMixinStr_O_RSYNC);
        }
    }




    static if(!is(typeof(O_DSYNC))) {
        private enum enumMixinStr_O_DSYNC = `enum O_DSYNC = __O_DSYNC;`;
        static if(is(typeof({ mixin(enumMixinStr_O_DSYNC); }))) {
            mixin(enumMixinStr_O_DSYNC);
        }
    }




    static if(!is(typeof(O_CLOEXEC))) {
        private enum enumMixinStr_O_CLOEXEC = `enum O_CLOEXEC = __O_CLOEXEC;`;
        static if(is(typeof({ mixin(enumMixinStr_O_CLOEXEC); }))) {
            mixin(enumMixinStr_O_CLOEXEC);
        }
    }




    static if(!is(typeof(O_NOFOLLOW))) {
        private enum enumMixinStr_O_NOFOLLOW = `enum O_NOFOLLOW = __O_NOFOLLOW;`;
        static if(is(typeof({ mixin(enumMixinStr_O_NOFOLLOW); }))) {
            mixin(enumMixinStr_O_NOFOLLOW);
        }
    }




    static if(!is(typeof(O_DIRECTORY))) {
        private enum enumMixinStr_O_DIRECTORY = `enum O_DIRECTORY = __O_DIRECTORY;`;
        static if(is(typeof({ mixin(enumMixinStr_O_DIRECTORY); }))) {
            mixin(enumMixinStr_O_DIRECTORY);
        }
    }




    static if(!is(typeof(F_SETLKW))) {
        private enum enumMixinStr_F_SETLKW = `enum F_SETLKW = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETLKW); }))) {
            mixin(enumMixinStr_F_SETLKW);
        }
    }




    static if(!is(typeof(F_SETLK))) {
        private enum enumMixinStr_F_SETLK = `enum F_SETLK = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_F_SETLK); }))) {
            mixin(enumMixinStr_F_SETLK);
        }
    }




    static if(!is(typeof(F_GETLK))) {
        private enum enumMixinStr_F_GETLK = `enum F_GETLK = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_F_GETLK); }))) {
            mixin(enumMixinStr_F_GETLK);
        }
    }




    static if(!is(typeof(__O_TMPFILE))) {
        private enum enumMixinStr___O_TMPFILE = `enum __O_TMPFILE = ( 020000000 | __O_DIRECTORY );`;
        static if(is(typeof({ mixin(enumMixinStr___O_TMPFILE); }))) {
            mixin(enumMixinStr___O_TMPFILE);
        }
    }




    static if(!is(typeof(__O_DSYNC))) {
        private enum enumMixinStr___O_DSYNC = `enum __O_DSYNC = std.conv.octal!10000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_DSYNC); }))) {
            mixin(enumMixinStr___O_DSYNC);
        }
    }




    static if(!is(typeof(__O_PATH))) {
        private enum enumMixinStr___O_PATH = `enum __O_PATH = std.conv.octal!10000000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_PATH); }))) {
            mixin(enumMixinStr___O_PATH);
        }
    }




    static if(!is(typeof(__O_NOATIME))) {
        private enum enumMixinStr___O_NOATIME = `enum __O_NOATIME = std.conv.octal!1000000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_NOATIME); }))) {
            mixin(enumMixinStr___O_NOATIME);
        }
    }




    static if(!is(typeof(__O_DIRECT))) {
        private enum enumMixinStr___O_DIRECT = `enum __O_DIRECT = std.conv.octal!40000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_DIRECT); }))) {
            mixin(enumMixinStr___O_DIRECT);
        }
    }




    static if(!is(typeof(__O_CLOEXEC))) {
        private enum enumMixinStr___O_CLOEXEC = `enum __O_CLOEXEC = std.conv.octal!2000000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_CLOEXEC); }))) {
            mixin(enumMixinStr___O_CLOEXEC);
        }
    }




    static if(!is(typeof(__O_NOFOLLOW))) {
        private enum enumMixinStr___O_NOFOLLOW = `enum __O_NOFOLLOW = std.conv.octal!400000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_NOFOLLOW); }))) {
            mixin(enumMixinStr___O_NOFOLLOW);
        }
    }




    static if(!is(typeof(__O_DIRECTORY))) {
        private enum enumMixinStr___O_DIRECTORY = `enum __O_DIRECTORY = std.conv.octal!200000;`;
        static if(is(typeof({ mixin(enumMixinStr___O_DIRECTORY); }))) {
            mixin(enumMixinStr___O_DIRECTORY);
        }
    }




    static if(!is(typeof(O_ASYNC))) {
        private enum enumMixinStr_O_ASYNC = `enum O_ASYNC = std.conv.octal!20000;`;
        static if(is(typeof({ mixin(enumMixinStr_O_ASYNC); }))) {
            mixin(enumMixinStr_O_ASYNC);
        }
    }




    static if(!is(typeof(O_FSYNC))) {
        private enum enumMixinStr_O_FSYNC = `enum O_FSYNC = O_SYNC;`;
        static if(is(typeof({ mixin(enumMixinStr_O_FSYNC); }))) {
            mixin(enumMixinStr_O_FSYNC);
        }
    }




    static if(!is(typeof(O_SYNC))) {
        private enum enumMixinStr_O_SYNC = `enum O_SYNC = std.conv.octal!4010000;`;
        static if(is(typeof({ mixin(enumMixinStr_O_SYNC); }))) {
            mixin(enumMixinStr_O_SYNC);
        }
    }




    static if(!is(typeof(O_NDELAY))) {
        private enum enumMixinStr_O_NDELAY = `enum O_NDELAY = O_NONBLOCK;`;
        static if(is(typeof({ mixin(enumMixinStr_O_NDELAY); }))) {
            mixin(enumMixinStr_O_NDELAY);
        }
    }




    static if(!is(typeof(O_NONBLOCK))) {
        private enum enumMixinStr_O_NONBLOCK = `enum O_NONBLOCK = std.conv.octal!4000;`;
        static if(is(typeof({ mixin(enumMixinStr_O_NONBLOCK); }))) {
            mixin(enumMixinStr_O_NONBLOCK);
        }
    }




    static if(!is(typeof(O_APPEND))) {
        private enum enumMixinStr_O_APPEND = `enum O_APPEND = std.conv.octal!2000;`;
        static if(is(typeof({ mixin(enumMixinStr_O_APPEND); }))) {
            mixin(enumMixinStr_O_APPEND);
        }
    }




    static if(!is(typeof(O_TRUNC))) {
        private enum enumMixinStr_O_TRUNC = `enum O_TRUNC = std.conv.octal!1000;`;
        static if(is(typeof({ mixin(enumMixinStr_O_TRUNC); }))) {
            mixin(enumMixinStr_O_TRUNC);
        }
    }




    static if(!is(typeof(O_NOCTTY))) {
        private enum enumMixinStr_O_NOCTTY = `enum O_NOCTTY = std.conv.octal!400;`;
        static if(is(typeof({ mixin(enumMixinStr_O_NOCTTY); }))) {
            mixin(enumMixinStr_O_NOCTTY);
        }
    }




    static if(!is(typeof(O_EXCL))) {
        private enum enumMixinStr_O_EXCL = `enum O_EXCL = std.conv.octal!200;`;
        static if(is(typeof({ mixin(enumMixinStr_O_EXCL); }))) {
            mixin(enumMixinStr_O_EXCL);
        }
    }




    static if(!is(typeof(O_CREAT))) {
        private enum enumMixinStr_O_CREAT = `enum O_CREAT = std.conv.octal!100;`;
        static if(is(typeof({ mixin(enumMixinStr_O_CREAT); }))) {
            mixin(enumMixinStr_O_CREAT);
        }
    }




    static if(!is(typeof(O_RDWR))) {
        private enum enumMixinStr_O_RDWR = `enum O_RDWR = std.conv.octal!2;`;
        static if(is(typeof({ mixin(enumMixinStr_O_RDWR); }))) {
            mixin(enumMixinStr_O_RDWR);
        }
    }




    static if(!is(typeof(O_WRONLY))) {
        private enum enumMixinStr_O_WRONLY = `enum O_WRONLY = std.conv.octal!1;`;
        static if(is(typeof({ mixin(enumMixinStr_O_WRONLY); }))) {
            mixin(enumMixinStr_O_WRONLY);
        }
    }




    static if(!is(typeof(O_RDONLY))) {
        private enum enumMixinStr_O_RDONLY = `enum O_RDONLY = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_O_RDONLY); }))) {
            mixin(enumMixinStr_O_RDONLY);
        }
    }




    static if(!is(typeof(O_ACCMODE))) {
        private enum enumMixinStr_O_ACCMODE = `enum O_ACCMODE = std.conv.octal!3;`;
        static if(is(typeof({ mixin(enumMixinStr_O_ACCMODE); }))) {
            mixin(enumMixinStr_O_ACCMODE);
        }
    }




    static if(!is(typeof(__BYTE_ORDER))) {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___BYTE_ORDER); }))) {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }
    static if(!is(typeof(_BITS_BYTESWAP_H))) {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); }))) {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_STDINT_H))) {
        private enum enumMixinStr__STDINT_H = `enum _STDINT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDINT_H); }))) {
            mixin(enumMixinStr__STDINT_H);
        }
    }
    static if(!is(typeof(INT8_MIN))) {
        private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MIN); }))) {
            mixin(enumMixinStr_INT8_MIN);
        }
    }




    static if(!is(typeof(INT16_MIN))) {
        private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MIN); }))) {
            mixin(enumMixinStr_INT16_MIN);
        }
    }




    static if(!is(typeof(INT32_MIN))) {
        private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MIN); }))) {
            mixin(enumMixinStr_INT32_MIN);
        }
    }




    static if(!is(typeof(INT64_MIN))) {
        private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MIN); }))) {
            mixin(enumMixinStr_INT64_MIN);
        }
    }




    static if(!is(typeof(INT8_MAX))) {
        private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MAX); }))) {
            mixin(enumMixinStr_INT8_MAX);
        }
    }




    static if(!is(typeof(INT16_MAX))) {
        private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MAX); }))) {
            mixin(enumMixinStr_INT16_MAX);
        }
    }




    static if(!is(typeof(INT32_MAX))) {
        private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MAX); }))) {
            mixin(enumMixinStr_INT32_MAX);
        }
    }




    static if(!is(typeof(INT64_MAX))) {
        private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MAX); }))) {
            mixin(enumMixinStr_INT64_MAX);
        }
    }




    static if(!is(typeof(UINT8_MAX))) {
        private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT8_MAX); }))) {
            mixin(enumMixinStr_UINT8_MAX);
        }
    }




    static if(!is(typeof(UINT16_MAX))) {
        private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT16_MAX); }))) {
            mixin(enumMixinStr_UINT16_MAX);
        }
    }




    static if(!is(typeof(UINT32_MAX))) {
        private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT32_MAX); }))) {
            mixin(enumMixinStr_UINT32_MAX);
        }
    }




    static if(!is(typeof(UINT64_MAX))) {
        private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT64_MAX); }))) {
            mixin(enumMixinStr_UINT64_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST8_MIN))) {
        private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST8_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST16_MIN))) {
        private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST16_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST32_MIN))) {
        private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST32_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST64_MIN))) {
        private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST64_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST8_MAX))) {
        private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST16_MAX))) {
        private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST32_MAX))) {
        private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST64_MAX))) {
        private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST8_MAX))) {
        private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST16_MAX))) {
        private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST32_MAX))) {
        private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST64_MAX))) {
        private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(INT_FAST8_MIN))) {
        private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); }))) {
            mixin(enumMixinStr_INT_FAST8_MIN);
        }
    }




    static if(!is(typeof(INT_FAST16_MIN))) {
        private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); }))) {
            mixin(enumMixinStr_INT_FAST16_MIN);
        }
    }




    static if(!is(typeof(INT_FAST32_MIN))) {
        private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); }))) {
            mixin(enumMixinStr_INT_FAST32_MIN);
        }
    }




    static if(!is(typeof(INT_FAST64_MIN))) {
        private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); }))) {
            mixin(enumMixinStr_INT_FAST64_MIN);
        }
    }




    static if(!is(typeof(INT_FAST8_MAX))) {
        private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); }))) {
            mixin(enumMixinStr_INT_FAST8_MAX);
        }
    }




    static if(!is(typeof(INT_FAST16_MAX))) {
        private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); }))) {
            mixin(enumMixinStr_INT_FAST16_MAX);
        }
    }




    static if(!is(typeof(INT_FAST32_MAX))) {
        private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); }))) {
            mixin(enumMixinStr_INT_FAST32_MAX);
        }
    }




    static if(!is(typeof(INT_FAST64_MAX))) {
        private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); }))) {
            mixin(enumMixinStr_INT_FAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST8_MAX))) {
        private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST8_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST16_MAX))) {
        private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST32_MAX))) {
        private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST64_MAX))) {
        private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST64_MAX);
        }
    }




    static if(!is(typeof(INTPTR_MIN))) {
        private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MIN); }))) {
            mixin(enumMixinStr_INTPTR_MIN);
        }
    }




    static if(!is(typeof(INTPTR_MAX))) {
        private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MAX); }))) {
            mixin(enumMixinStr_INTPTR_MAX);
        }
    }




    static if(!is(typeof(UINTPTR_MAX))) {
        private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); }))) {
            mixin(enumMixinStr_UINTPTR_MAX);
        }
    }




    static if(!is(typeof(INTMAX_MIN))) {
        private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MIN); }))) {
            mixin(enumMixinStr_INTMAX_MIN);
        }
    }




    static if(!is(typeof(INTMAX_MAX))) {
        private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MAX); }))) {
            mixin(enumMixinStr_INTMAX_MAX);
        }
    }




    static if(!is(typeof(UINTMAX_MAX))) {
        private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); }))) {
            mixin(enumMixinStr_UINTMAX_MAX);
        }
    }




    static if(!is(typeof(PTRDIFF_MIN))) {
        private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); }))) {
            mixin(enumMixinStr_PTRDIFF_MIN);
        }
    }




    static if(!is(typeof(PTRDIFF_MAX))) {
        private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); }))) {
            mixin(enumMixinStr_PTRDIFF_MAX);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MIN))) {
        private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MIN);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MAX))) {
        private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MAX);
        }
    }




    static if(!is(typeof(SIZE_MAX))) {
        private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_SIZE_MAX); }))) {
            mixin(enumMixinStr_SIZE_MAX);
        }
    }




    static if(!is(typeof(WCHAR_MIN))) {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = ( - 0x7fffffff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MIN); }))) {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }




    static if(!is(typeof(WCHAR_MAX))) {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MAX); }))) {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }




    static if(!is(typeof(WINT_MIN))) {
        private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = ( 0u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MIN); }))) {
            mixin(enumMixinStr_WINT_MIN);
        }
    }




    static if(!is(typeof(WINT_MAX))) {
        private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = ( 4294967295u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MAX); }))) {
            mixin(enumMixinStr_WINT_MAX);
        }
    }
    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }
    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }






    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if(!is(typeof(__glibc_has_include))) {
        private enum enumMixinStr___glibc_has_include = `enum __glibc_has_include = __has_include;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_has_include); }))) {
            mixin(enumMixinStr___glibc_has_include);
        }
    }
    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }




    static if(!is(typeof(_SYS_SELECT_H))) {
        private enum enumMixinStr__SYS_SELECT_H = `enum _SYS_SELECT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_SELECT_H); }))) {
            mixin(enumMixinStr__SYS_SELECT_H);
        }
    }






    static if(!is(typeof(__NFDBITS))) {
        private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr___NFDBITS); }))) {
            mixin(enumMixinStr___NFDBITS);
        }
    }
    static if(!is(typeof(FD_SETSIZE))) {
        private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_FD_SETSIZE); }))) {
            mixin(enumMixinStr_FD_SETSIZE);
        }
    }




    static if(!is(typeof(NFDBITS))) {
        private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr_NFDBITS); }))) {
            mixin(enumMixinStr_NFDBITS);
        }
    }
    static if(!is(typeof(_SYS_STAT_H))) {
        private enum enumMixinStr__SYS_STAT_H = `enum _SYS_STAT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_STAT_H); }))) {
            mixin(enumMixinStr__SYS_STAT_H);
        }
    }
    static if(!is(typeof(S_IREAD))) {
        private enum enumMixinStr_S_IREAD = `enum S_IREAD = std.conv.octal!400;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IREAD); }))) {
            mixin(enumMixinStr_S_IREAD);
        }
    }




    static if(!is(typeof(S_IWRITE))) {
        private enum enumMixinStr_S_IWRITE = `enum S_IWRITE = std.conv.octal!200;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IWRITE); }))) {
            mixin(enumMixinStr_S_IWRITE);
        }
    }




    static if(!is(typeof(S_IEXEC))) {
        private enum enumMixinStr_S_IEXEC = `enum S_IEXEC = std.conv.octal!100;`;
        static if(is(typeof({ mixin(enumMixinStr_S_IEXEC); }))) {
            mixin(enumMixinStr_S_IEXEC);
        }
    }




    static if(!is(typeof(ACCESSPERMS))) {
        private enum enumMixinStr_ACCESSPERMS = `enum ACCESSPERMS = ( ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) | ( ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) >> 3 ) | ( ( ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) >> 3 ) >> 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_ACCESSPERMS); }))) {
            mixin(enumMixinStr_ACCESSPERMS);
        }
    }




    static if(!is(typeof(ALLPERMS))) {
        private enum enumMixinStr_ALLPERMS = `enum ALLPERMS = ( std.conv.octal!4000 | std.conv.octal!2000 | std.conv.octal!1000 | ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) | ( ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) >> 3 ) | ( ( ( std.conv.octal!400 | std.conv.octal!200 | std.conv.octal!100 ) >> 3 ) >> 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_ALLPERMS); }))) {
            mixin(enumMixinStr_ALLPERMS);
        }
    }




    static if(!is(typeof(DEFFILEMODE))) {
        private enum enumMixinStr_DEFFILEMODE = `enum DEFFILEMODE = ( std.conv.octal!400 | std.conv.octal!200 | ( std.conv.octal!400 >> 3 ) | ( std.conv.octal!200 >> 3 ) | ( ( std.conv.octal!400 >> 3 ) >> 3 ) | ( ( std.conv.octal!200 >> 3 ) >> 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_DEFFILEMODE); }))) {
            mixin(enumMixinStr_DEFFILEMODE);
        }
    }




    static if(!is(typeof(S_BLKSIZE))) {
        private enum enumMixinStr_S_BLKSIZE = `enum S_BLKSIZE = 512;`;
        static if(is(typeof({ mixin(enumMixinStr_S_BLKSIZE); }))) {
            mixin(enumMixinStr_S_BLKSIZE);
        }
    }




    static if(!is(typeof(_MKNOD_VER))) {
        private enum enumMixinStr__MKNOD_VER = `enum _MKNOD_VER = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__MKNOD_VER); }))) {
            mixin(enumMixinStr__MKNOD_VER);
        }
    }




    static if(!is(typeof(_SYS_STATVFS_H))) {
        private enum enumMixinStr__SYS_STATVFS_H = `enum _SYS_STATVFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_STATVFS_H); }))) {
            mixin(enumMixinStr__SYS_STATVFS_H);
        }
    }




    static if(!is(typeof(_SYS_TYPES_H))) {
        private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); }))) {
            mixin(enumMixinStr__SYS_TYPES_H);
        }
    }
    static if(!is(typeof(__BIT_TYPES_DEFINED__))) {
        private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); }))) {
            mixin(enumMixinStr___BIT_TYPES_DEFINED__);
        }
    }
    static if(!is(typeof(_UTIME_H))) {
        private enum enumMixinStr__UTIME_H = `enum _UTIME_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__UTIME_H); }))) {
            mixin(enumMixinStr__UTIME_H);
        }
    }





}


struct SMBC_internal_data;
