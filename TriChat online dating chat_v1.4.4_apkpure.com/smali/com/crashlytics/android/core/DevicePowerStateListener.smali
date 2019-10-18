.class Lcom/crashlytics/android/core/DevicePowerStateListener;
.super Ljava/lang/Object;
.source "DevicePowerStateListener.java"


# static fields
.field private static final FILTER_BATTERY_CHANGED:Landroid/content/IntentFilter;

.field private static final FILTER_POWER_CONNECTED:Landroid/content/IntentFilter;

.field private static final FILTER_POWER_DISCONNECTED:Landroid/content/IntentFilter;


# instance fields
.field private final context:Landroid/content/Context;

.field private isPowerConnected:Z

.field private final powerConnectedReceiver:Landroid/content/BroadcastReceiver;

.field private final powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

.field private final receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 16
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_BATTERY_CHANGED:Landroid/content/IntentFilter;

    .line 18
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_POWER_CONNECTED:Landroid/content/IntentFilter;

    .line 20
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_POWER_DISCONNECTED:Landroid/content/IntentFilter;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    .line 33
    new-instance v0, Lcom/crashlytics/android/core/DevicePowerStateListener$1;

    invoke-direct {v0, p0}, Lcom/crashlytics/android/core/DevicePowerStateListener$1;-><init>(Lcom/crashlytics/android/core/DevicePowerStateListener;)V

    iput-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    .line 40
    new-instance v0, Lcom/crashlytics/android/core/DevicePowerStateListener$2;

    invoke-direct {v0, p0}, Lcom/crashlytics/android/core/DevicePowerStateListener$2;-><init>(Lcom/crashlytics/android/core/DevicePowerStateListener;)V

    iput-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 48
    return-void
.end method

.method static synthetic access$002(Lcom/crashlytics/android/core/DevicePowerStateListener;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/crashlytics/android/core/DevicePowerStateListener;
    .param p1, "x1"    # Z

    .prologue
    .line 14
    iput-boolean p1, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->isPowerConnected:Z

    return p1
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 83
    iget-object v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method public initialize()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v0, -0x1

    .line 51
    iget-object v3, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->receiversRegistered:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 63
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v3, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    const/4 v4, 0x0

    sget-object v5, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_BATTERY_CHANGED:Landroid/content/IntentFilter;

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    .line 56
    .local v1, "statusIntent":Landroid/content/Intent;
    if-eqz v1, :cond_1

    const-string v3, "status"

    .line 57
    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 58
    .local v0, "status":I
    :cond_1
    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    const/4 v3, 0x5

    if-ne v0, v3, :cond_3

    :cond_2
    :goto_1
    iput-boolean v2, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->isPowerConnected:Z

    .line 61
    iget-object v2, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerConnectedReceiver:Landroid/content/BroadcastReceiver;

    sget-object v4, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_POWER_CONNECTED:Landroid/content/IntentFilter;

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 62
    iget-object v2, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->powerDisconnectedReceiver:Landroid/content/BroadcastReceiver;

    sget-object v4, Lcom/crashlytics/android/core/DevicePowerStateListener;->FILTER_POWER_DISCONNECTED:Landroid/content/IntentFilter;

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto :goto_0

    .line 58
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public isPowerConnected()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/crashlytics/android/core/DevicePowerStateListener;->isPowerConnected:Z

    return v0
.end method
