# klaytn-Bapp



## 클레이튼 이해하기

합의 알고리즘 예시
Public 블록체인 : pow, pos 등등
Private 블록체인 : pBFT, Raft 등등

BFT (비잔티움 결함 허용)
- 참여 노드 수 제한 / 성능 높임
- 분산화 약화 / 투명성 저하

클레이튼 합의 알고리즘IBFT
(이스탄불 비잔티움 결함 허용)
: 공개를 통한 개인적인 합의 신뢰 모델 (private consensus with public disclosure)

클레이튼의 노드는
합의를 하는 소수의 private 노드들과
바깥에서 블록생성 결과 접근 및 검증 하는 노드들로 구성되어 있다

Proposer - 매 라운드마다 합의노드들 중에 제안자를 뽑는다
나머지 합의 노드들은 validator가 된다.(검증을 하게 된다)

커밋 단계에서 proposer에게서 받은 제안을 수락할지 결정한다
(Finality )

<br/>
<br/>

## 클레이튼의 블록생성 사이클 (cycle)
= 블록생성주기 = 라운드(round)
= 블록생성 간격 = 약 1초 


제안자와 위원회 선택 (proposer and committee selection)

제안자(proposer)를 무작위 & 결정적으로 governance council 노드들 중 뽑음

*Governance Council : 합의 노드들

각각의 합의 노드는 가장 최근의 블록헤더에서 파생된 난수를 사용하여 
자기가 해당 라운드에 선택됐는지 증명한다.

<br/>
<br/>
## 블록 제안과 검증 (Block Proposal and Validation)
- 제안자로서 선택된 노드는 자신이 그 라운드에서 제안자로 뽑힌 근거를 다른 합의 노드들에게 알리게 된다. 여기서 제안자의 공개키를 통해 입증 가능한 암호증명을 사용한다.
 그리고 나서 해당 라운드에서 위원회로 뽑힌 그룹은 제안자에게  본인들이 왜 위원회 멤버로 뽑혔는지 증거와 함께 알려주게 된다.
 
- 누가 제안자고 누가 위원회인지 파악이되면 제안자가 트랜잭션 풀에서 트랜잭션들을 선택하고 블록을 만들게 된다. (합의를 한다)


<br/>
<br/>

## 블록전파(Block Propagation)

제안된 블록은 위원회 멤버들의 2/3 이상의 서명을 받아야 한다.
위원회가 합의에 이르게 되면 새로운 블록이 모든 합의 노드들에게 전달이되고
그 합의 라운드는 끝나게 된다.
그렇게 되면 프록시 노드를 통해 엔드포인트 노드들에게 전달된다.

클레이튼 네트워크 구조

하나의 core cell은 하나의 참여자가 운영을 한다.
엔드포인트 노드는 누구나 될 수 있다.

<br/>
<br/>


## 코어셀(Core cell)

사용자가 많아져서 확장이 필요할 때 일반적인 서버와 차이점
일반적인 서버 : 서버를 늘리고 Request 를 분할 처리
<-> 클레이튼: 노드 자체의 성능을 늘림

CN(합의 노드) 참여 조건
- Physical core가 40개 이상
- 256 GB RAM
- 1년치의 데이터 약 14TB저장
- 10G 네트워크

<br/>
<br/>

## 클레이튼의 서비스 체인

언제쓰이나? 
- bapp이 특별한 노드 환경에서 세팅되어야 할 때
- 보안 수준을 맞춤형으로 설정하여 운영하고 싶을 때  

- 많은 처리량이 요구되어 메인넷 배포시 경제성이 낮을 경우

- 독립된 서비스 공간을 구축해서 필요할 때 메인넷에 신뢰를 고정
- Gas 비용을 안받도록 설정 가능 

<br/>
<br/>

## 이더리움과 클레이튼의 차이 
1) 이더리움
- 단일 네트워크 
- 네트워크 구성원간의 구분이 없다
- 누구나 블록 생성이 가능하지만 블록을 만들었을 때 내가 가장 먼저 만들었다고 전파해야 함
  >>합의 알고리즘으로 Pow(Proof -of - work, 작업증명 방식 ) 채택 

이더리움에서는 마이닝 노드가 누가될 지 모르기 때문에, 최대한 많은 노드들에게 붙어야 한다.
(그래야 전파받을 확률이 올라가니까! )

*마이닝 노드(mining node) : 블록을 쓰고 네트워크에 전파한 노드

2) 클레이튼
- Two Layer Architecture Trust Model
- 매 라운드마다 합의 노드들 중 하나가 뽑혀서 블록을 쓴다.

<br/>
<br/>