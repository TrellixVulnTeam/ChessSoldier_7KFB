/*
	Generated by KBEngine!
	Please do not modify this file!
	tools = kbcmd
*/

namespace KBEngine
{
	using UnityEngine;
	using System;
	using System.Collections;
	using System.Collections.Generic;

	public class EntityDef
	{
		public static Dictionary<string, UInt16> datatype2id = new Dictionary<string, UInt16>();
		public static Dictionary<string, DATATYPE_BASE> datatypes = new Dictionary<string, DATATYPE_BASE>();
		public static Dictionary<UInt16, DATATYPE_BASE> id2datatypes = new Dictionary<UInt16, DATATYPE_BASE>();
		public static Dictionary<string, Int32> entityclass = new Dictionary<string, Int32>();
		public static Dictionary<string, ScriptModule> moduledefs = new Dictionary<string, ScriptModule>();
		public static Dictionary<UInt16, ScriptModule> idmoduledefs = new Dictionary<UInt16, ScriptModule>();

		public static bool init()
		{
			initDataTypes();
			initDefTypes();
			initScriptModules();
			return true;
		}

		public static bool reset()
		{
			clear();
			return init();
		}

		public static void clear()
		{
			datatype2id.Clear();
			datatypes.Clear();
			id2datatypes.Clear();
			entityclass.Clear();
			moduledefs.Clear();
			idmoduledefs.Clear();
		}

		public static void initDataTypes()
		{
			datatypes["UINT8"] = new DATATYPE_UINT8();
			datatypes["UINT16"] = new DATATYPE_UINT16();
			datatypes["UINT32"] = new DATATYPE_UINT32();
			datatypes["UINT64"] = new DATATYPE_UINT64();

			datatypes["INT8"] = new DATATYPE_INT8();
			datatypes["INT16"] = new DATATYPE_INT16();
			datatypes["INT32"] = new DATATYPE_INT32();
			datatypes["INT64"] = new DATATYPE_INT64();

			datatypes["FLOAT"] = new DATATYPE_FLOAT();
			datatypes["DOUBLE"] = new DATATYPE_DOUBLE();

			datatypes["STRING"] = new DATATYPE_STRING();
			datatypes["VECTOR2"] = new DATATYPE_VECTOR2();

			datatypes["VECTOR3"] = new DATATYPE_VECTOR3();

			datatypes["VECTOR4"] = new DATATYPE_VECTOR4();
			datatypes["PYTHON"] = new DATATYPE_PYTHON();

			datatypes["UNICODE"] = new DATATYPE_UNICODE();
			datatypes["MAILBOX"] = new DATATYPE_MAILBOX();

			datatypes["BLOB"] = new DATATYPE_BLOB();
		}

		public static void initScriptModules()
		{
			ScriptModule pAccountModule = new ScriptModule("Account");
			EntityDef.moduledefs["Account"] = pAccountModule;
			EntityDef.idmoduledefs[1] = pAccountModule;

			Property pAccount_position = new Property();
			pAccount_position.name = "position";
			pAccount_position.properUtype = 40000;
			pAccount_position.properFlags = 4;
			pAccount_position.aliasID = 0;
			Vector3 Account_position_defval = new Vector3();
			pAccount_position.defaultVal = Account_position_defval;
			pAccountModule.propertys["position"] = pAccount_position; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_position.aliasID] = pAccount_position;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(position / 40000).");

			Property pAccount_direction = new Property();
			pAccount_direction.name = "direction";
			pAccount_direction.properUtype = 40001;
			pAccount_direction.properFlags = 4;
			pAccount_direction.aliasID = 1;
			Vector3 Account_direction_defval = new Vector3();
			pAccount_direction.defaultVal = Account_direction_defval;
			pAccountModule.propertys["direction"] = pAccount_direction; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_direction.aliasID] = pAccount_direction;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(direction / 40001).");

			Property pAccount_spaceID = new Property();
			pAccount_spaceID.name = "spaceID";
			pAccount_spaceID.properUtype = 40002;
			pAccount_spaceID.properFlags = 16;
			pAccount_spaceID.aliasID = 2;
			UInt32 Account_spaceID_defval;
			UInt32.TryParse("", out Account_spaceID_defval);
			pAccount_spaceID.defaultVal = Account_spaceID_defval;
			pAccountModule.propertys["spaceID"] = pAccount_spaceID; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_spaceID.aliasID] = pAccount_spaceID;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(spaceID / 40002).");

			Property pAccount_RoleLevel = new Property();
			pAccount_RoleLevel.name = "RoleLevel";
			pAccount_RoleLevel.properUtype = 3;
			pAccount_RoleLevel.properFlags = 32;
			pAccount_RoleLevel.aliasID = 3;
			UInt32 Account_RoleLevel_defval;
			UInt32.TryParse("1", out Account_RoleLevel_defval);
			pAccount_RoleLevel.defaultVal = Account_RoleLevel_defval;
			pAccountModule.propertys["RoleLevel"] = pAccount_RoleLevel; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_RoleLevel.aliasID] = pAccount_RoleLevel;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(RoleLevel / 3).");

			Property pAccount_RoleName = new Property();
			pAccount_RoleName.name = "RoleName";
			pAccount_RoleName.properUtype = 2;
			pAccount_RoleName.properFlags = 32;
			pAccount_RoleName.aliasID = 4;
			string Account_RoleName_defval = "";
			pAccount_RoleName.defaultVal = Account_RoleName_defval;
			pAccountModule.propertys["RoleName"] = pAccount_RoleName; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_RoleName.aliasID] = pAccount_RoleName;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(RoleName / 2).");

			Property pAccount_RoleType = new Property();
			pAccount_RoleType.name = "RoleType";
			pAccount_RoleType.properUtype = 1;
			pAccount_RoleType.properFlags = 32;
			pAccount_RoleType.aliasID = 5;
			UInt16 Account_RoleType_defval;
			UInt16.TryParse("0", out Account_RoleType_defval);
			pAccount_RoleType.defaultVal = Account_RoleType_defval;
			pAccountModule.propertys["RoleType"] = pAccount_RoleType; 

			pAccountModule.usePropertyDescrAlias = true;
			pAccountModule.idpropertys[(UInt16)pAccount_RoleType.aliasID] = pAccount_RoleType;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), property(RoleType / 1).");

			List<DATATYPE_BASE> pAccount_QueryPlayerCountResponse_args = new List<DATATYPE_BASE>();
			pAccount_QueryPlayerCountResponse_args.Add(EntityDef.id2datatypes[4]);

			Method pAccount_QueryPlayerCountResponse = new Method();
			pAccount_QueryPlayerCountResponse.name = "QueryPlayerCountResponse";
			pAccount_QueryPlayerCountResponse.methodUtype = 10;
			pAccount_QueryPlayerCountResponse.aliasID = 0;
			pAccount_QueryPlayerCountResponse.args = pAccount_QueryPlayerCountResponse_args;

			pAccountModule.methods["QueryPlayerCountResponse"] = pAccount_QueryPlayerCountResponse; 
			pAccountModule.useMethodDescrAlias = true;
			pAccountModule.idmethods[(UInt16)pAccount_QueryPlayerCountResponse.aliasID] = pAccount_QueryPlayerCountResponse;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(QueryPlayerCountResponse / 10).");

			List<DATATYPE_BASE> pAccount_ReCreateAccountResponse_args = new List<DATATYPE_BASE>();
			pAccount_ReCreateAccountResponse_args.Add(EntityDef.id2datatypes[8]);

			Method pAccount_ReCreateAccountResponse = new Method();
			pAccount_ReCreateAccountResponse.name = "ReCreateAccountResponse";
			pAccount_ReCreateAccountResponse.methodUtype = 9;
			pAccount_ReCreateAccountResponse.aliasID = 1;
			pAccount_ReCreateAccountResponse.args = pAccount_ReCreateAccountResponse_args;

			pAccountModule.methods["ReCreateAccountResponse"] = pAccount_ReCreateAccountResponse; 
			pAccountModule.useMethodDescrAlias = true;
			pAccountModule.idmethods[(UInt16)pAccount_ReCreateAccountResponse.aliasID] = pAccount_ReCreateAccountResponse;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(ReCreateAccountResponse / 9).");

			List<DATATYPE_BASE> pAccount_onInitBattleField_args = new List<DATATYPE_BASE>();

			Method pAccount_onInitBattleField = new Method();
			pAccount_onInitBattleField.name = "onInitBattleField";
			pAccount_onInitBattleField.methodUtype = 12;
			pAccount_onInitBattleField.aliasID = 2;
			pAccount_onInitBattleField.args = pAccount_onInitBattleField_args;

			pAccountModule.methods["onInitBattleField"] = pAccount_onInitBattleField; 
			pAccountModule.useMethodDescrAlias = true;
			pAccountModule.idmethods[(UInt16)pAccount_onInitBattleField.aliasID] = pAccount_onInitBattleField;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(onInitBattleField / 12).");

			List<DATATYPE_BASE> pAccount_onMarchMsg_args = new List<DATATYPE_BASE>();
			pAccount_onMarchMsg_args.Add(EntityDef.id2datatypes[12]);

			Method pAccount_onMarchMsg = new Method();
			pAccount_onMarchMsg.name = "onMarchMsg";
			pAccount_onMarchMsg.methodUtype = 11;
			pAccount_onMarchMsg.aliasID = 3;
			pAccount_onMarchMsg.args = pAccount_onMarchMsg_args;

			pAccountModule.methods["onMarchMsg"] = pAccount_onMarchMsg; 
			pAccountModule.useMethodDescrAlias = true;
			pAccountModule.idmethods[(UInt16)pAccount_onMarchMsg.aliasID] = pAccount_onMarchMsg;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(onMarchMsg / 11).");

			List<DATATYPE_BASE> pAccount_EntryFBSceneRequest_args = new List<DATATYPE_BASE>();
			pAccount_EntryFBSceneRequest_args.Add(EntityDef.id2datatypes[4]);

			Method pAccount_EntryFBSceneRequest = new Method();
			pAccount_EntryFBSceneRequest.name = "EntryFBSceneRequest";
			pAccount_EntryFBSceneRequest.methodUtype = 2;
			pAccount_EntryFBSceneRequest.aliasID = -1;
			pAccount_EntryFBSceneRequest.args = pAccount_EntryFBSceneRequest_args;

			pAccountModule.methods["EntryFBSceneRequest"] = pAccount_EntryFBSceneRequest; 
			pAccountModule.base_methods["EntryFBSceneRequest"] = pAccount_EntryFBSceneRequest;

			pAccountModule.idbase_methods[pAccount_EntryFBSceneRequest.methodUtype] = pAccount_EntryFBSceneRequest;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(EntryFBSceneRequest / 2).");

			List<DATATYPE_BASE> pAccount_QueryPlayerCountRequest_args = new List<DATATYPE_BASE>();

			Method pAccount_QueryPlayerCountRequest = new Method();
			pAccount_QueryPlayerCountRequest.name = "QueryPlayerCountRequest";
			pAccount_QueryPlayerCountRequest.methodUtype = 3;
			pAccount_QueryPlayerCountRequest.aliasID = -1;
			pAccount_QueryPlayerCountRequest.args = pAccount_QueryPlayerCountRequest_args;

			pAccountModule.methods["QueryPlayerCountRequest"] = pAccount_QueryPlayerCountRequest; 
			pAccountModule.base_methods["QueryPlayerCountRequest"] = pAccount_QueryPlayerCountRequest;

			pAccountModule.idbase_methods[pAccount_QueryPlayerCountRequest.methodUtype] = pAccount_QueryPlayerCountRequest;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(QueryPlayerCountRequest / 3).");

			List<DATATYPE_BASE> pAccount_ReCreateAccountRequest_args = new List<DATATYPE_BASE>();
			pAccount_ReCreateAccountRequest_args.Add(EntityDef.id2datatypes[3]);
			pAccount_ReCreateAccountRequest_args.Add(EntityDef.id2datatypes[1]);

			Method pAccount_ReCreateAccountRequest = new Method();
			pAccount_ReCreateAccountRequest.name = "ReCreateAccountRequest";
			pAccount_ReCreateAccountRequest.methodUtype = 1;
			pAccount_ReCreateAccountRequest.aliasID = -1;
			pAccount_ReCreateAccountRequest.args = pAccount_ReCreateAccountRequest_args;

			pAccountModule.methods["ReCreateAccountRequest"] = pAccount_ReCreateAccountRequest; 
			pAccountModule.base_methods["ReCreateAccountRequest"] = pAccount_ReCreateAccountRequest;

			pAccountModule.idbase_methods[pAccount_ReCreateAccountRequest.methodUtype] = pAccount_ReCreateAccountRequest;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(ReCreateAccountRequest / 1).");

			List<DATATYPE_BASE> pAccount_reqHasEnteredBattlefiled_args = new List<DATATYPE_BASE>();

			Method pAccount_reqHasEnteredBattlefiled = new Method();
			pAccount_reqHasEnteredBattlefiled.name = "reqHasEnteredBattlefiled";
			pAccount_reqHasEnteredBattlefiled.methodUtype = 4;
			pAccount_reqHasEnteredBattlefiled.aliasID = -1;
			pAccount_reqHasEnteredBattlefiled.args = pAccount_reqHasEnteredBattlefiled_args;

			pAccountModule.methods["reqHasEnteredBattlefiled"] = pAccount_reqHasEnteredBattlefiled; 
			pAccountModule.base_methods["reqHasEnteredBattlefiled"] = pAccount_reqHasEnteredBattlefiled;

			pAccountModule.idbase_methods[pAccount_reqHasEnteredBattlefiled.methodUtype] = pAccount_reqHasEnteredBattlefiled;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Account), method(reqHasEnteredBattlefiled / 4).");

			ScriptModule pAvatarModule = new ScriptModule("Avatar");
			EntityDef.moduledefs["Avatar"] = pAvatarModule;
			EntityDef.idmoduledefs[2] = pAvatarModule;

			Property pAvatar_position = new Property();
			pAvatar_position.name = "position";
			pAvatar_position.properUtype = 40000;
			pAvatar_position.properFlags = 4;
			pAvatar_position.aliasID = 0;
			Vector3 Avatar_position_defval = new Vector3();
			pAvatar_position.defaultVal = Avatar_position_defval;
			pAvatarModule.propertys["position"] = pAvatar_position; 

			pAvatarModule.usePropertyDescrAlias = true;
			pAvatarModule.idpropertys[(UInt16)pAvatar_position.aliasID] = pAvatar_position;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Avatar), property(position / 40000).");

			Property pAvatar_direction = new Property();
			pAvatar_direction.name = "direction";
			pAvatar_direction.properUtype = 40001;
			pAvatar_direction.properFlags = 4;
			pAvatar_direction.aliasID = 1;
			Vector3 Avatar_direction_defval = new Vector3();
			pAvatar_direction.defaultVal = Avatar_direction_defval;
			pAvatarModule.propertys["direction"] = pAvatar_direction; 

			pAvatarModule.usePropertyDescrAlias = true;
			pAvatarModule.idpropertys[(UInt16)pAvatar_direction.aliasID] = pAvatar_direction;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Avatar), property(direction / 40001).");

			Property pAvatar_spaceID = new Property();
			pAvatar_spaceID.name = "spaceID";
			pAvatar_spaceID.properUtype = 40002;
			pAvatar_spaceID.properFlags = 16;
			pAvatar_spaceID.aliasID = 2;
			UInt32 Avatar_spaceID_defval;
			UInt32.TryParse("", out Avatar_spaceID_defval);
			pAvatar_spaceID.defaultVal = Avatar_spaceID_defval;
			pAvatarModule.propertys["spaceID"] = pAvatar_spaceID; 

			pAvatarModule.usePropertyDescrAlias = true;
			pAvatarModule.idpropertys[(UInt16)pAvatar_spaceID.aliasID] = pAvatar_spaceID;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Avatar), property(spaceID / 40002).");

			Property pAvatar_roleName = new Property();
			pAvatar_roleName.name = "roleName";
			pAvatar_roleName.properUtype = 6;
			pAvatar_roleName.properFlags = 32;
			pAvatar_roleName.aliasID = 3;
			string Avatar_roleName_defval = "";
			pAvatar_roleName.defaultVal = Avatar_roleName_defval;
			pAvatarModule.propertys["roleName"] = pAvatar_roleName; 

			pAvatarModule.usePropertyDescrAlias = true;
			pAvatarModule.idpropertys[(UInt16)pAvatar_roleName.aliasID] = pAvatar_roleName;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Avatar), property(roleName / 6).");

			Property pAvatar_roleType = new Property();
			pAvatar_roleType.name = "roleType";
			pAvatar_roleType.properUtype = 7;
			pAvatar_roleType.properFlags = 32;
			pAvatar_roleType.aliasID = 4;
			UInt16 Avatar_roleType_defval;
			UInt16.TryParse("", out Avatar_roleType_defval);
			pAvatar_roleType.defaultVal = Avatar_roleType_defval;
			pAvatarModule.propertys["roleType"] = pAvatar_roleType; 

			pAvatarModule.usePropertyDescrAlias = true;
			pAvatarModule.idpropertys[(UInt16)pAvatar_roleType.aliasID] = pAvatar_roleType;

			//Dbg.DEBUG_MSG("EntityDef::initScriptModules: add(Avatar), property(roleType / 7).");

		}

		public static void initDefTypes()
		{
			{
				UInt16 utype = 2;
				string typeName = "UINT8";
				string name = "UINT8";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 3;
				string typeName = "UINT16";
				string name = "UINT16";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 5;
				string typeName = "UINT64";
				string name = "UINT64";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 4;
				string typeName = "UINT32";
				string name = "UINT32";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 6;
				string typeName = "INT8";
				string name = "INT8";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 7;
				string typeName = "INT16";
				string name = "INT16";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 8;
				string typeName = "INT32";
				string name = "INT32";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 9;
				string typeName = "INT64";
				string name = "INT64";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 1;
				string typeName = "STRING";
				string name = "STRING";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 12;
				string typeName = "UNICODE";
				string name = "UNICODE";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 13;
				string typeName = "FLOAT";
				string name = "FLOAT";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 14;
				string typeName = "DOUBLE";
				string name = "DOUBLE";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 10;
				string typeName = "PYTHON";
				string name = "PYTHON";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 10;
				string typeName = "PY_DICT";
				string name = "PY_DICT";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 10;
				string typeName = "PY_TUPLE";
				string name = "PY_TUPLE";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 10;
				string typeName = "PY_LIST";
				string name = "PY_LIST";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 10;
				string typeName = "MAILBOX";
				string name = "MAILBOX";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 11;
				string typeName = "BLOB";
				string name = "BLOB";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 15;
				string typeName = "VECTOR2";
				string name = "VECTOR2";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 16;
				string typeName = "VECTOR3";
				string name = "VECTOR3";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			{
				UInt16 utype = 17;
				string typeName = "VECTOR4";
				string name = "VECTOR4";
				DATATYPE_BASE val = null;
				EntityDef.datatypes.TryGetValue(name, out val);
				EntityDef.datatypes[typeName] = val;
				EntityDef.id2datatypes[utype] = EntityDef.datatypes[typeName];
				EntityDef.datatype2id[typeName] = utype;
			}

			foreach(string datatypeStr in EntityDef.datatypes.Keys)
			{
				DATATYPE_BASE dataType = EntityDef.datatypes[datatypeStr];
				if(dataType != null)
				{
					dataType.bind();
				}
			}
		}

	}


}