import libsmbclient;
import std.string : fromStringz, toStringz;
import std.exception : enforce;
import core.time : Duration, to, msecs;
import std.conv : to;
import std.format : format;

void init(smbc_get_auth_data_fn fn, int debugLevel)
{
	auto result = smbc_init(fn,debugLevel);
	enforce(result == 0, "error initializing samba client library - out of memory or cannot find smb.conf?");
}

static NotifyCallbackFunction notify_cb = (actions, privateData)
{
	import std.stdio;
	writeln(actions);
	return 0;
};

enum AllChangeNotificationTypes = [
	ChangeNotificationType.fileName,
	ChangeNotificationType.dirName,
	ChangeNotificationType.attributes,
	ChangeNotificationType.size,
	ChangeNotificationType.lastWrite,
	ChangeNotificationType.lastAccess,
	ChangeNotificationType.creation,
	ChangeNotificationType.extendedAttributes,
	ChangeNotificationType.security,
	ChangeNotificationType.streamName,
	ChangeNotificationType.streamSize,
	ChangeNotificationType.streamWrite,
];

void main(string[] args)
{
	int count;
	init(&get_auth_data_fn,1); // enable debug
	auto context = ClientContext.createNew();
	auto dir = SambaDirectory.open(args[1]);
	context.requestNotifications(dir, true, AllChangeNotificationTypes, 1000.msecs,notify_cb, (cast(ubyte*)&count)[0 .. count.sizeof]);
	dir.close();
}


extern(C) void get_auth_data_fn(const(char)* pServer, const(char)* pShare, char* pWorkgroup, int maxLenWorkgroup,
							char* pUsername, int maxLenUsername, char* pPassword, int maxLenPassword)
{
	import std.process : environment;
	import std.string : toStringz;
	*pWorkgroup = '\0';
	auto username = environment.get("CARBON_USER") ~ '\0';
	enforce(username.length <= maxLenUsername, "username exceeds allocated space");
	pUsername[0 .. username.length] = username[0 .. $];
	auto password = environment.get("CARBON_PW") ~ '\0';
	enforce(password.length <= maxLenPassword, "passwordexceeds allocated space");
	pPassword[0 .. password.length] = password[0 .. $];
}

struct ClientContext
{
	SMBCCTX* handle;

	static ClientContext createNew()
	{
		auto result = smbc_new_context();
		enforce (result !is null, "unable to create new samba client context");
		result = smbc_init_context(result);
		enforce (result !is null, "unable to initialise new samba client context");
		return ClientContext(result);
	}

	void free(bool shutdownContext = true)
	{
		auto result = smbc_free_context(handle, shutdownContext ? 1 : 0);
		enforce(result == 0, "error freeing samba client context");
	}

	~this()
	{
		if (handle !is null)
			this.free();
		handle = null;
	}

	int getDebugLevel()
	{
		return smbc_getDebug(handle);
	}

	void setDebugLevel(int debugLevel)
	{
		smbc_setDebug(handle, debugLevel);
	}

	void setLogCallback(void* privatePtr, smbc_debug_callback_fn fn)
	{
		smbc_setLogCallback(handle,privatePtr,fn);
	}

	int setConfigurationFile(string filename)
	{
		return smbc_setConfiguration(handle,filename.toStringz);
	}

	string getNetbiosName()
	{
		return smbc_getNetbiosName(handle).fromStringz.idup;
	}

	void setNetbiosName(string netbiosName)
	{
		smbc_setNetbiosName(handle,netbiosName.toStringz);
	}

	string getWorkgroup()
	{
		return smbc_getWorkgroup(handle).fromStringz.idup;
	}

	void setWorkgroup(string workgroup)
	{
		smbc_setWorkgroup(handle,workgroup.toStringz);
	}

	string getUser()
	{
		return smbc_getUser(handle).fromStringz.idup;
	}

	void setUser(string user)
	{
		smbc_setUser(handle,user.toStringz);
	}

	Duration getTimeout()
	{
		return smbc_getTimeout(handle).msecs;
	}

	void setTimeout(Duration timeoutDuration)
	{
		smbc_setTimeout(handle,timeoutDuration.total!"msecs".to!int);
	}

	ushort getPort()
	{
		return smbc_getPort(handle);
	}

	void setPort(ushort port)
	{
		smbc_setPort(handle,port);
	}

	bool getOptionDebugToStderr()
	{
		return (smbc_getOptionDebugToStderr(handle) != 0);
	}

	void setOptionDebugToStderr(bool enable)
	{
		smbc_setOptionDebugToStderr(handle, handle ? 1 : 0);
	}

	bool getOptionFullTimeNames()
	{
		return (smbc_getOptionFullTimeNames(handle) != 0);
	}

	void setOptionFullTimeNames(bool enabled)
	{
		smbc_setOptionFullTimeNames(handle,enabled ? 1 : 0);
	}

	smbc_share_mode getOptionOpenShareMode()
	{
		return smbc_getOptionOpenShareMode(handle);
	}

	void setOptionOpenShareMode(smbc_share_mode shareMode)
	{
		smbc_setOptionOpenShareMode(handle,shareMode);
	}

	static void* smbc_getOptionUserData()
	{
		return smbc_getOptionUserData();
	}

	void setOptionUserData(void* userData)
	{
		smbc_setOptionUserData(handle,userData);
	}

	smbc_smb_encrypt_level getOptionSmbEncryptionLevel()
	{
		return smbc_getOptionSmbEncryptionLevel(handle);
	}

	void setOptionSmbEncryptionLevel(smbc_smb_encrypt_level level)
	{
		smbc_setOptionSmbEncryptionLevel(handle,level);
	}

	bool getOptionCaseSensitive()
	{
		return (smbc_getOptionCaseSensitive(handle) != 0);
	}

	void setOptionCaseSensitive(bool value)
	{
		smbc_setOptionCaseSensitive(handle, value ? 1 : 0);
	}

	int getOptionBrowseMaxLmbCount()
	{
		return smbc_getOptionBrowseMaxLmbCount(handle);
	}

	void setOptionBrowseMaxLmbCount(int count)
	{
		smbc_setOptionBrowseMaxLmbCount(handle,count);
	}

	bool getOptionUrlEncodeReaddirEntries()
	{
		return (smbc_getOptionUrlEncodeReaddirEntries(handle) != 0);
	}

	void setOptionUrlEncodeReaddirEntries(bool value)
	{
		smbc_setOptionUrlEncodeReaddirEntries(handle, value ? 1 : 0);
	}

	bool getOptionOneSharePerServer()
	{
		return (smbc_getOptionOneSharePerServer(handle) != 0);
	}

	void setOptionOneSharePerServer(bool value)
	{
		smbc_setOptionOneSharePerServer(handle, value ? 1 : 0);
	}

	bool getOptionUseKerberos()
	{
		return (smbc_getOptionUseKerberos(handle) != 0);
	}

	void setOptionUseKerberos(bool value)
	{
		smbc_setOptionUseKerberos(handle, value ? 1 : 0);
	}

	bool getOptionFallbackAfterKerberos()
	{
		return (smbc_getOptionFallbackAfterKerberos(handle) != 0);
	}

	void setOptionFallbackAfterKerberos(bool value)
	{
		smbc_setOptionFallbackAfterKerberos(handle, value ? 1 : 0);
	}

	bool getOptionNoAutoAnonymousLogin()
	{
		return (smbc_getOptionNoAutoAnonymousLogin(handle) != 0);
	}

	void setOptionNoAutoAnonoymousLogin(bool value)
	{
		smbc_setOptionNoAutoAnonymousLogin(handle, value ? 1 : 0);
	}

	bool getOptionUseCCache()
	{
		return (smbc_getOptionUseCCache(handle) != 0);
	}

	void setOptionUseCCache(bool value)
	{
		smbc_setOptionUseCCache(handle, value ? 1 : 0);
	}

	bool getOptionUseNTHash()
	{
		return (smbc_getOptionUseNTHash(handle) != 0);
	}

	void setOptionUseNTHash(bool value)
	{
		smbc_setOptionUseNTHash(handle, value ? 1 : 0);
	}

	bool setOptionProtocols(string minProto, string maxProto)
	{
		return (smbc_setOptionProtocols(handle, minProto.toStringz, maxProto.toStringz) != 0);
	}

	version(None)
	{
		int removeUnusedServer(SMBCSRV* srv)
		{
			return smbc_remove_unused_server(handle,srv);
		}
	}


	void setCredentials(string workgroup, string user, string password)
	{
		smbc_set_credentials_with_fallback(handle,workgroup.toStringz,user.toStringz,password.toStringz);
	}

	//void requestNotifications(SMBCFILE* directory, bool recursive, ChangeNotificationType[] notificationTypes, Duration heartbeatInterval,NotifyCallbackFunction callbackFunction,ubyte[] privateData)
	void requestNotifications(SambaDirectory directory, bool recursive, ChangeNotificationType[] notificationTypes, Duration heartbeatInterval,NotifyCallbackFunction callbackFunction,ubyte[] privateData)
	{
		uint notification_types = notificationTypes.orEnums;
		auto timeout = heartbeatInterval.total!"msecs".to!uint;
		//auto notify_fn = smbc_getFunctionNotify(handle);
		auto notifyCallbackPrivateData = new NotifyCallbackPrivateData(callbackFunction, privateData);
		//auto result = notify_fn(handle,directory, recursive ? 1 : 0, notification_types, timeout, &notifyCallbackFunctionC,cast(void*)notifyCallbackPrivateData);
		auto result = smbc_notify(directory.handle, recursive ? 1 : 0, notification_types, timeout, &notifyCallbackFunctionC,cast(void*)notifyCallbackPrivateData);
		enforce(result >= 0);
	}
}

//alias SMBCFILE = void;
//alias SMBCDIR = void;

int printFile(string filename, string printQueue)
{
	return smbc_print_file(filename.toStringz,printQueue.toStringz);
}

int openPrintJob(string filename)
{
	return smbc_open_print_job(filename.toStringz);
}

int listPrintJobs(string printShareURL, smbc_list_print_job_fn fn)
{
	return smbc_list_print_jobs(printShareURL.toStringz, fn);
}

int unlinkPrintJob(string printShareURL, int id)
{
	return smbc_unlink_print_job(printShareURL.toStringz,id);
}

//getExtendedAttributes(int fd, string name)
//{

int removeExtendedAttributes(string url, string name)
{
	import std.string : toStringz;
	return smbc_removexattr(url.toStringz,name.toStringz);
}

auto listExtendedAttributes(string filename)
{
	import std.typecons : tuple;
	enum AttributeListBufferSize = 4 * 1024 * 1024UL;
	auto buf = new ubyte[AttributeListBufferSize];
	return tuple(smbc_listxattr(filename.toStringz,cast(char*)buf.ptr,AttributeListBufferSize),(cast(char[])buf).idup);
}


struct SambaFile
{
	import core.time : Duration;

	int handle = -1;

	this(int handle)
	{
		this.handle = handle;
	}

	~this()
	{
		if (handle != -1)
			close();
	}

	immutable(ubyte)[] read()
	{
		auto buf = new ubyte[16_384*1024];
		auto len = smbc_read(this.handle, cast(void*)buf.ptr,buf.length);
		enforce(len >= 0, "error reading");
		buf.length = len;
		return buf.idup;
	}

	void write(const(ubyte)[] buf)
	{
		auto result = smbc_write(handle,cast(void*)buf.ptr,buf.length);
		enforce(result == buf.length, "error writing");
	}

	off_t lseek(off_t offset_, int whence)
	{
		return smbc_lseek(handle,offset_,whence);
	}

	void close()
	{
		auto result = smbc_close(handle);
		enforce(result == 0);
		handle = -1;
	}

}

SambaFile openFile(string fileURL, int flags, mode_t mode)
{
	auto result = smbc_open(fileURL.toStringz,flags,mode);
	enforce(result > 0, sambaError(result));
	return SambaFile(result);
}

string sambaError(int result)
{
	return format!"samba error: %s"(result);
}


static SambaFile createFile(string fileURL, mode_t mode)
{
	auto result = smbc_creat(fileURL.toStringz,mode);
	enforce(result > 0, sambaError(result));
	return SambaFile(result);
}

void unlink(string url)
{
	auto result = smbc_unlink(url.toStringz);
	enforce(result == 0);
}

void rename(string fromURL, string toURL)
{
	auto result = smbc_rename(fromURL.toStringz, toURL.toStringz);
	enforce(result == 0);
}

struct SambaDirectory
{
	import core.time : Duration;

	int handle = -1;

	this(int handle)
	{
		this.handle = handle;
	}

	static SambaDirectory open(string directoryURL)
	{
		auto result = smbc_opendir(directoryURL.toStringz);
		enforce(result > 0, sambaError(result));
		return SambaDirectory(result);
	}

	void close()
	{
		auto result = smbc_closedir(handle);
		enforce(result > 0, sambaError(result));
		handle = -1;
	}

	~this()
	{
		if (handle > 0)
			close();
	}
}

auto orEnums(T)(T[] enums)
{
	int ret;
	foreach(v;enums)
	{
		ret |= cast(int)v;
	}
	return ret;
}

extern(C) int notifyCallbackFunctionC(const(smbc_notify_callback_action)* actions_ptr, size_t num_actions, void* private_data)
{
	import std.algorithm : map;
	import std.array : array;
	auto privateData = cast(NotifyCallbackPrivateData*) private_data;
	auto actions = actions_ptr[0 .. num_actions]
					.map!(action => NotifyCallbackAction(action))
					.array;
	return privateData.f(actions,privateData.data);
}

	
struct NotifyCallbackPrivateData
{
	NotifyCallbackFunction f;
	ubyte[] data;
}

struct NotifyCallbackAction
{
	ActionNotificationType actionType;
	string filename;

	this(smbc_notify_callback_action action)
	{
		actionType = cast(ActionNotificationType) action.action;
		filename = action.filename.fromStringz.idup;
	}
}

alias NotifyCallbackFunction = int function(NotifyCallbackAction[] actions, ubyte[] privateData);

enum ChangeNotificationType
{
	fileName = SMBC_NOTIFY_CHANGE_FILE_NAME,
	dirName = SMBC_NOTIFY_CHANGE_DIR_NAME,
	attributes = SMBC_NOTIFY_CHANGE_ATTRIBUTES,
	size = SMBC_NOTIFY_CHANGE_SIZE,
	lastWrite = SMBC_NOTIFY_CHANGE_LAST_WRITE,
	lastAccess = SMBC_NOTIFY_CHANGE_LAST_ACCESS,
	creation = SMBC_NOTIFY_CHANGE_CREATION,
	extendedAttributes = SMBC_NOTIFY_CHANGE_EA,
	security = SMBC_NOTIFY_CHANGE_SECURITY,
	streamName = SMBC_NOTIFY_CHANGE_STREAM_NAME,
	streamSize = SMBC_NOTIFY_CHANGE_STREAM_SIZE,
	streamWrite = SMBC_NOTIFY_CHANGE_STREAM_WRITE,
}

enum ActionNotificationType
{
	added = SMBC_NOTIFY_ACTION_ADDED,
	removed = SMBC_NOTIFY_ACTION_REMOVED,
	modified = SMBC_NOTIFY_ACTION_MODIFIED,
	oldName = SMBC_NOTIFY_ACTION_OLD_NAME,
	newName = SMBC_NOTIFY_ACTION_NEW_NAME,
	addedStream = SMBC_NOTIFY_ACTION_ADDED_STREAM,
	removedStream = SMBC_NOTIFY_ACTION_REMOVED_STREAM,
	modifiedStream = SMBC_NOTIFY_ACTION_MODIFIED_STREAM,
}

