//
//  DijkstraDemo.m
//  FROSTPlatform
//
//  Created by frost on 17/2/7.
//  Copyright © 2017年 frost. All rights reserved.
//

#import "DijkstraDemo.h"

#define MAXEDgE 10
#define MAXVEX 10
#define MAX_INFINITYS 65535

typedef struct
{
    int vexs[MAXVEX];
    int arc[MAXVEX][MAXVEX];
    int numVertexes, numEdges;
}Mgraph;

typedef int Patharc[MAXVEX];
typedef int ShortPathTable[MAXVEX];

@implementation DijkstraDemo


#pragma mark - life cycle

-(instancetype)init {
    if (self = [super init]) {
        
        Mgraph g;
        CreateMgraph(&g);
        
        int v0;
        Patharc P;
        ShortPathTable D; /* 求某点到其余各点的最短路径 */
        v0=0;
        ShortestPath_Dijkstra(g, v0, &P, &D);
    }
    return self;
}

#pragma mark - Private Methods

void CreateMgraph(Mgraph *g)
{
    int i, j;
    
    /* printf("请输入边数和顶点数:"); */
    g->numEdges=6;
    g->numVertexes=5;
    
    for (i = 0; i < g->numVertexes; i++)/* 初始化图 */
    {
        g->vexs[i]=i;
    }
    
    for (i = 0; i < g->numVertexes; i++)/* 初始化图 */
    {
        for ( j = 0; j < g->numVertexes; j++)
        {
            if (i==j) {
                g->arc[i][j]=0;
            } else {
                g->arc[i][j] = g->arc[j][i] = MAX_INFINITYS;
            }
        }
    }
    
    g->arc[0][1]=5;
    g->arc[0][2]=7;
    g->arc[1][2]=1;
    g->arc[1][3]=200;
    g->arc[2][4]=3;
    g->arc[3][4]=1;
    
    for(i = 0; i < g->numVertexes; i++)
    {
        for(j = i; j < g->numVertexes; j++)
        {
            g->arc[j][i] =g->arc[i][j];
        }
    }
}


void ShortestPath_Dijkstra(Mgraph g, int v0, Patharc *P, ShortPathTable *D)
{
    int v,w,k,min;
    int final[MAXVEX];                    /* final[w]=1表示求得顶点v0至vw的最短路径 */
    
    /* 初始化数据 */
    for(v=0; v<g.numVertexes; v++)
    {
        final[v] = 0;                    /* 全部顶点初始化为未知最短路径状态 */
        (*D)[v] = g.arc[v0][v];            /* 将与v0点有连线的顶点加上权值 */
        (*P)[v] = 0;                    /* 初始化路径数组P为0 */
    }
    
    (*D)[v0] = 0;                        /* v0至v0路径为0 */
    final[v0] = 1;                        /* v0至v0不需要求路径 */
    
    /* 开始主循环，每次求得v0到某个v顶点的最短路径 */
    for(v=1; v<g.numVertexes; v++)
    {
        min=MAX_INFINITYS;                    /* 当前所知离v0顶点的最近距离 */
        for(w=0; w<g.numVertexes; w++) /* 寻找离v0最近的顶点 */
        {
            if(!final[w] && (*D)[w]<min)
            {
                k=w;
                min = (*D)[w];            /* w顶点离v0顶点更近 */
            }
        }
        final[k] = 1;                    /* 将目前找到的最近的顶点置为1 */
        
        /* 修正当前最短路径及距离 */
        for(w=0; w<g.numVertexes; w++)
        {
            /* 如果经过v顶点的路径比现在这条路径的长度短的话 */
            if(!final[w] && (min+g.arc[k][w]<(*D)[w]))
            {
                /* 说明找到了更短的路径，修改D[w]和P[w] */
                (*D)[w] = min + g.arc[k][w]; /* 修改当前路径长度 */
                (*P)[w]=k;
            }
        }
    }
}

@end
