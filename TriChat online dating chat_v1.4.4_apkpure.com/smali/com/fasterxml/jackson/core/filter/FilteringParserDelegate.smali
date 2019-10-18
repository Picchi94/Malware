.class public Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;
.super Lcom/fasterxml/jackson/core/util/JsonParserDelegate;
.source "FilteringParserDelegate.java"


# instance fields
.field protected _allowMultipleMatches:Z

.field protected _currToken:Lcom/fasterxml/jackson/core/JsonToken;

.field protected _exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

.field protected _headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

.field protected _includeImmediateParent:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected _includePath:Z

.field protected _itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

.field protected _lastClearedToken:Lcom/fasterxml/jackson/core/JsonToken;

.field protected _matchCount:I

.field protected rootFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/core/filter/TokenFilter;ZZ)V
    .locals 1
    .param p1, "p"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "f"    # Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .param p3, "includePath"    # Z
    .param p4, "allowMultipleMatches"    # Z

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/util/JsonParserDelegate;-><init>(Lcom/fasterxml/jackson/core/JsonParser;)V

    .line 118
    iput-object p2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->rootFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 120
    iput-object p2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 121
    invoke-static {p2}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createRootContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 122
    iput-boolean p3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    .line 123
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_allowMultipleMatches:Z

    .line 124
    return-void
.end method

.method private _nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 4
    .param p1, "buffRoot"    # Lcom/fasterxml/jackson/core/filter/TokenFilterContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 735
    iput-object p1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 736
    move-object v0, p1

    .line 737
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/filter/TokenFilterContext;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->nextTokenToRead()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 738
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-eqz v1, :cond_0

    move-object v2, v1

    .line 758
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    return-object v2

    .line 743
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_0
    iget-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-ne v0, v3, :cond_1

    .line 744
    const-string v3, "Internal error: failed to locate expected buffered tokens"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v3

    throw v3

    .line 751
    :cond_1
    iget-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v3, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->findChildOf(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v0

    .line 752
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 753
    if-nez v0, :cond_2

    .line 754
    const-string v3, "Unexpected problem: chain of filtered context broken"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v3

    throw v3

    .line 756
    :cond_2
    iget-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->nextTokenToRead()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 757
    if-eqz v1, :cond_0

    move-object v2, v1

    .line 758
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_0
.end method


# virtual methods
.method protected _filterContext()Lcom/fasterxml/jackson/core/JsonStreamContext;
    .locals 1

    .prologue
    .line 890
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-eqz v0, :cond_0

    .line 891
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 893
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    goto :goto_0
.end method

.method protected final _nextToken2()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 454
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 455
    .local v3, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-nez v3, :cond_1

    .line 456
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .line 592
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .local v4, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_1
    return-object v4

    .line 460
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_1
    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 584
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 585
    .local v0, "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_11

    .line 586
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_1

    .line 462
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :pswitch_0
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 463
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_2

    .line 464
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 465
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_1

    .line 467
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_2
    if-nez v0, :cond_3

    .line 468
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_0

    .line 472
    :cond_3
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 473
    if-nez v0, :cond_4

    .line 474
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_0

    .line 477
    :cond_4
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v5, :cond_5

    .line 478
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartArray()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 480
    :cond_5
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 481
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_6

    .line 482
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 483
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_1

    .line 485
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_6
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 487
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_0

    .line 488
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 489
    if-eqz v3, :cond_0

    .line 490
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .line 491
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_1

    .line 497
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :pswitch_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 498
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_7

    .line 499
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 500
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_1

    .line 502
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_7
    if-nez v0, :cond_8

    .line 503
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 507
    :cond_8
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 508
    if-nez v0, :cond_9

    .line 509
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 512
    :cond_9
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v5, :cond_a

    .line 513
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartObject()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 515
    :cond_a
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 516
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_b

    .line 517
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 518
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 520
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_b
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0, v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 521
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_0

    .line 522
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 523
    if-eqz v3, :cond_0

    .line 524
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .line 525
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 533
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :pswitch_2
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v2

    .line 534
    .local v2, "returnEnd":Z
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 535
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    if-eqz v0, :cond_c

    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v5, :cond_c

    .line 536
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterFinishArray()V

    .line 538
    :cond_c
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getParent()Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 539
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 540
    if-eqz v2, :cond_0

    .line 541
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 548
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v2    # "returnEnd":Z
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :pswitch_3
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 549
    .local v1, "name":Ljava/lang/String;
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->setFieldName(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 550
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_d

    .line 551
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 552
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 554
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_d
    if-nez v0, :cond_e

    .line 555
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 556
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 559
    :cond_e
    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 560
    if-nez v0, :cond_f

    .line 561
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 562
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 565
    :cond_f
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 566
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v5, :cond_10

    .line 567
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_0

    .line 568
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 573
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_10
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_0

    .line 574
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 575
    if-eqz v3, :cond_0

    .line 576
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .line 577
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 588
    .end local v1    # "name":Ljava/lang/String;
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_11
    if-eqz v0, :cond_0

    .line 589
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 590
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v5, :cond_12

    if-eqz v0, :cond_0

    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    .line 591
    invoke-virtual {v0, v5}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeValue(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 592
    :cond_12
    iput-object v3, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v3

    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto/16 :goto_1

    .line 460
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected final _nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;
    .locals 9
    .param p1, "buffRoot"    # Lcom/fasterxml/jackson/core/filter/TokenFilterContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 609
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 610
    .local v4, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-nez v4, :cond_2

    .line 724
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_1
    :goto_1
    return-object v4

    .line 619
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_2
    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 716
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 717
    .local v0, "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_12

    .line 718
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto :goto_1

    .line 621
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_0
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    iget-object v8, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    invoke-virtual {v7, v8}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 622
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    if-nez v0, :cond_3

    .line 623
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_0

    .line 626
    :cond_3
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v7, :cond_4

    .line 627
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartArray()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 629
    :cond_4
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 630
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_5

    .line 631
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6, v0, v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 632
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto :goto_1

    .line 634
    :cond_5
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    goto :goto_0

    .line 638
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 639
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_6

    .line 640
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6, v0, v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    goto :goto_1

    .line 643
    :cond_6
    if-nez v0, :cond_7

    .line 644
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_0

    .line 648
    :cond_7
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 649
    if-nez v0, :cond_8

    .line 650
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_0

    .line 653
    :cond_8
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v7, :cond_9

    .line 654
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartObject()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 656
    :cond_9
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 657
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_a

    .line 658
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6, v0, v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 659
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto/16 :goto_1

    .line 661
    :cond_a
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7, v0, v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    goto/16 :goto_0

    .line 669
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_2
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 670
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    if-eqz v0, :cond_b

    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v7, :cond_b

    .line 671
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterFinishArray()V

    .line 673
    :cond_b
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-ne v7, p1, :cond_d

    move v1, v5

    .line 674
    .local v1, "gotEnd":Z
    :goto_2
    if-eqz v1, :cond_e

    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v7

    if-eqz v7, :cond_e

    move v3, v5

    .line 676
    .local v3, "returnEnd":Z
    :goto_3
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getParent()Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 677
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 679
    if-nez v3, :cond_1

    .line 683
    if-nez v1, :cond_c

    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-ne v7, p1, :cond_0

    .line 684
    :cond_c
    const/4 v4, 0x0

    goto/16 :goto_1

    .end local v1    # "gotEnd":Z
    .end local v3    # "returnEnd":Z
    :cond_d
    move v1, v6

    .line 673
    goto :goto_2

    .restart local v1    # "gotEnd":Z
    :cond_e
    move v3, v6

    .line 674
    goto :goto_3

    .line 691
    .end local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v1    # "gotEnd":Z
    :pswitch_3
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 692
    .local v2, "name":Ljava/lang/String;
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7, v2}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->setFieldName(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 693
    .restart local v0    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_f

    .line 694
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 695
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto/16 :goto_1

    .line 697
    :cond_f
    if-nez v0, :cond_10

    .line 698
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 699
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 702
    :cond_10
    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 703
    if-nez v0, :cond_11

    .line 704
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 705
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_0

    .line 708
    :cond_11
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 709
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v0, v7, :cond_0

    .line 710
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto/16 :goto_1

    .line 720
    .end local v2    # "name":Ljava/lang/String;
    :cond_12
    if-eqz v0, :cond_0

    .line 721
    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v7, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v0

    .line 722
    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v0, v7, :cond_13

    if-eqz v0, :cond_0

    iget-object v7, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    .line 723
    invoke-virtual {v0, v7}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeValue(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 724
    :cond_13
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextBuffered(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto/16 :goto_1

    .line 619
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public clearCurrentToken()V
    .locals 1

    .prologue
    .line 197
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_lastClearedToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 199
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 201
    :cond_0
    return-void
.end method

.method public getBigIntegerValue()Ljava/math/BigInteger;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 823
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getBigIntegerValue()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method public getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B
    .locals 1
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 879
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonParser;->getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    return-object v0
.end method

.method public getBooleanValue()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 826
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v0

    return v0
.end method

.method public getByteValue()B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 829
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getByteValue()B

    move-result v0

    return v0
.end method

.method public getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentName()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_filterContext()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object v0

    .line 182
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/JsonStreamContext;
    iget-object v2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_2

    .line 183
    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getParent()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object v1

    .line 184
    .local v1, "parent":Lcom/fasterxml/jackson/core/JsonStreamContext;
    if-nez v1, :cond_1

    const/4 v2, 0x0

    .line 186
    .end local v1    # "parent":Lcom/fasterxml/jackson/core/JsonStreamContext;
    :goto_0
    return-object v2

    .line 184
    .restart local v1    # "parent":Lcom/fasterxml/jackson/core/JsonStreamContext;
    :cond_1
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 186
    .end local v1    # "parent":Lcom/fasterxml/jackson/core/JsonStreamContext;
    :cond_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method public final getCurrentTokenId()I
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 152
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    goto :goto_0
.end method

.method public getDecimalValue()Ljava/math/BigDecimal;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 835
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getDecimalValue()Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method public getDoubleValue()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 838
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getDoubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getEmbeddedObject()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 878
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getEmbeddedObject()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->rootFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    return-object v0
.end method

.method public getFloatValue()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 841
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getFloatValue()F

    move-result v0

    return v0
.end method

.method public getIntValue()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 844
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v0

    return v0
.end method

.method public getLastClearedToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_lastClearedToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0
.end method

.method public getLongValue()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 847
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMatchCount()I
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_matchCount:I

    return v0
.end method

.method public getNumberType()Lcom/fasterxml/jackson/core/JsonParser$NumberType;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 850
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getNumberType()Lcom/fasterxml/jackson/core/JsonParser$NumberType;

    move-result-object v0

    return-object v0
.end method

.method public getNumberValue()Ljava/lang/Number;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 853
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getNumberValue()Ljava/lang/Number;

    move-result-object v0

    return-object v0
.end method

.method public getParsingContext()Lcom/fasterxml/jackson/core/JsonStreamContext;
    .locals 1

    .prologue
    .line 175
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_filterContext()Lcom/fasterxml/jackson/core/JsonStreamContext;

    move-result-object v0

    return-object v0
.end method

.method public getShortValue()S
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 832
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getShortValue()S

    move-result v0

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 810
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextCharacters()[C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 812
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getTextCharacters()[C

    move-result-object v0

    return-object v0
.end method

.method public getTextLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 813
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getTextLength()I

    move-result v0

    return v0
.end method

.method public getTextOffset()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 814
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getTextOffset()I

    move-result v0

    return v0
.end method

.method public getTokenLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .locals 1

    .prologue
    .line 881
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getTokenLocation()Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsBoolean()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 867
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result v0

    return v0
.end method

.method public getValueAsBoolean(Z)Z
    .locals 1
    .param p1, "defaultValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 868
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean(Z)Z

    move-result v0

    return v0
.end method

.method public getValueAsDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 865
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public getValueAsDouble(D)D
    .locals 3
    .param p1, "defaultValue"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 866
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getValueAsInt()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 861
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result v0

    return v0
.end method

.method public getValueAsInt(I)I
    .locals 1
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 862
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt(I)I

    move-result v0

    return v0
.end method

.method public getValueAsLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 863
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public getValueAsLong(J)J
    .locals 3
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 864
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getValueAsString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 869
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "defaultValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 870
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasCurrentToken()Z
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasTextCharacters()Z
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->hasTextCharacters()Z

    move-result v0

    return v0
.end method

.method public final hasToken(Lcom/fasterxml/jackson/core/JsonToken;)Z
    .locals 1
    .param p1, "t"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasTokenId(I)Z
    .locals 4
    .param p1, "id"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 157
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 158
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-nez v0, :cond_2

    .line 159
    if-nez p1, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v1

    :cond_1
    move v1, v2

    .line 159
    goto :goto_0

    .line 161
    :cond_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v3

    if-eq v3, p1, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public isExpectedStartArrayToken()Z
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExpectedStartObjectToken()Z
    .locals 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x1

    .line 227
    iget-boolean v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_allowMultipleMatches:Z

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-nez v6, :cond_1

    .line 229
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonToken;->isStructEnd()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 230
    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v5

    .line 441
    :goto_0
    return-object v4

    .line 234
    :cond_0
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonToken;->isScalarValue()Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v6

    if-nez v6, :cond_1

    iget-boolean v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    sget-object v7, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v6, v7, :cond_1

    .line 236
    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    move-object v4, v5

    goto :goto_0

    .line 240
    :cond_1
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 242
    .local v0, "ctxt":Lcom/fasterxml/jackson/core/filter/TokenFilterContext;
    if-eqz v0, :cond_5

    .line 244
    :cond_2
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->nextTokenToRead()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 245
    .local v4, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-eqz v4, :cond_3

    .line 246
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_0

    .line 250
    :cond_3
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    if-ne v0, v6, :cond_4

    .line 251
    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 252
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->inArray()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 253
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 256
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_0

    .line 272
    :cond_4
    iget-object v6, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v6, v0}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->findChildOf(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v0

    .line 273
    iput-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 274
    if-nez v0, :cond_2

    .line 275
    const-string v5, "Unexpected problem: chain of filtered context broken"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v5

    throw v5

    .line 281
    .end local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_5
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 282
    .restart local v4    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-nez v4, :cond_6

    .line 284
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_0

    .line 290
    :cond_6
    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 425
    iget-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 426
    .local v1, "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_18

    .line 427
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_0

    .line 292
    .end local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 293
    .restart local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_7

    .line 294
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v8}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 295
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_0

    .line 297
    :cond_7
    if-nez v1, :cond_9

    .line 298
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 441
    :cond_8
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextToken2()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    goto/16 :goto_0

    .line 302
    :cond_9
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 303
    if-nez v1, :cond_a

    .line 304
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 307
    :cond_a
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v1, v5, :cond_b

    .line 308
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartArray()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 310
    :cond_b
    iput-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 311
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_c

    .line 312
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v8}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 313
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 315
    :cond_c
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v9}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildArrayContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 318
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_8

    .line 319
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 320
    if-eqz v4, :cond_8

    .line 321
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 328
    .end local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_1
    iget-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 329
    .restart local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_d

    .line 330
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v8}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 331
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 333
    :cond_d
    if-nez v1, :cond_e

    .line 334
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 338
    :cond_e
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 339
    if-nez v1, :cond_f

    .line 340
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 343
    :cond_f
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v1, v5, :cond_10

    .line 344
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterStartObject()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 346
    :cond_10
    iput-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 347
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_11

    .line 348
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v8}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 349
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 351
    :cond_11
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1, v9}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->createChildObjectContext(Lcom/fasterxml/jackson/core/filter/TokenFilter;Z)Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 353
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_8

    .line 354
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 355
    if-eqz v4, :cond_8

    .line 356
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 367
    .end local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    :pswitch_2
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v3

    .line 368
    .local v3, "returnEnd":Z
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 369
    .restart local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    if-eqz v1, :cond_12

    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v1, v5, :cond_12

    .line 370
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->filterFinishArray()V

    .line 372
    :cond_12
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getParent()Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 373
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->getFilter()Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v5

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 374
    if-eqz v3, :cond_8

    .line 375
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 382
    .end local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    .end local v3    # "returnEnd":Z
    :pswitch_3
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    .line 384
    .local v2, "name":Ljava/lang/String;
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v2}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->setFieldName(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 385
    .restart local v1    # "f":Lcom/fasterxml/jackson/core/filter/TokenFilter;
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_14

    .line 386
    iput-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 387
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-nez v5, :cond_13

    .line 390
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includeImmediateParent:Z

    if-eqz v5, :cond_13

    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->isStartHandled()Z

    move-result v5

    if-nez v5, :cond_13

    .line 391
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->nextTokenToRead()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 392
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    iput-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_exposedContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    .line 395
    :cond_13
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 397
    :cond_14
    if-nez v1, :cond_15

    .line 398
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 399
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 402
    :cond_15
    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeProperty(Ljava/lang/String;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 403
    if-nez v1, :cond_16

    .line 404
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 405
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 408
    :cond_16
    iput-object v1, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_itemFilter:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    .line 409
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-ne v1, v5, :cond_17

    .line 410
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_17

    .line 411
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 414
    :cond_17
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_includePath:Z

    if-eqz v5, :cond_8

    .line 415
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_nextTokenWithBuffering(Lcom/fasterxml/jackson/core/filter/TokenFilterContext;)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    .line 416
    if-eqz v4, :cond_8

    .line 417
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 429
    .end local v2    # "name":Ljava/lang/String;
    :cond_18
    if-eqz v1, :cond_8

    .line 430
    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_headContext:Lcom/fasterxml/jackson/core/filter/TokenFilterContext;

    invoke-virtual {v5, v1}, Lcom/fasterxml/jackson/core/filter/TokenFilterContext;->checkValue(Lcom/fasterxml/jackson/core/filter/TokenFilter;)Lcom/fasterxml/jackson/core/filter/TokenFilter;

    move-result-object v1

    .line 431
    sget-object v5, Lcom/fasterxml/jackson/core/filter/TokenFilter;->INCLUDE_ALL:Lcom/fasterxml/jackson/core/filter/TokenFilter;

    if-eq v1, v5, :cond_19

    if-eqz v1, :cond_8

    iget-object v5, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    .line 432
    invoke-virtual {v1, v5}, Lcom/fasterxml/jackson/core/filter/TokenFilter;->includeValue(Lcom/fasterxml/jackson/core/JsonParser;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 433
    :cond_19
    iput-object v4, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_0

    .line 290
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public nextValue()Lcom/fasterxml/jackson/core/JsonToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 766
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 767
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 768
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 770
    :cond_0
    return-object v0
.end method

.method public overrideCurrentName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 212
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Can not currently override name during filtering read"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public readBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;)I
    .locals 1
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 880
    iget-object v0, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->delegate:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0, p1, p2}, Lcom/fasterxml/jackson/core/JsonParser;->readBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;)I

    move-result v0

    return v0
.end method

.method public skipChildren()Lcom/fasterxml/jackson/core/JsonParser;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 781
    iget-object v2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_1

    .line 798
    :cond_0
    :goto_0
    return-object p0

    .line 785
    :cond_1
    const/4 v0, 0x1

    .line 790
    .local v0, "open":I
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/filter/FilteringParserDelegate;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 791
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-eqz v1, :cond_0

    .line 794
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->isStructStart()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 795
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 796
    :cond_3
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->isStructEnd()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 797
    add-int/lit8 v0, v0, -0x1

    if-nez v0, :cond_2

    goto :goto_0
.end method
